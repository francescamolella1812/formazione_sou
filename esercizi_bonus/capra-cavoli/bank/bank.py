import asyncio
import os
import subprocess
from typing import Dict, Set

BANK_NAME = os.environ.get("BANK_NAME", "BANK").upper()
LISTEN_PORT = int(os.environ.get("LISTEN_PORT", "5000"))

PEER_HOST = os.environ.get("PEER_HOST", "")
PEER_PORT = int(os.environ.get("PEER_PORT", "5000"))

INIT_CHARACTERS = [
    c.strip().lower()
    for c in os.environ.get("INIT_CHARACTERS", "").split(",")
    if c.strip()
]

# Regole classiche:
# se farmer NON è presente sulla sponda:
#  - wolf + goat => goat eaten
#  - goat + cabbage => cabbage eaten
PREDATION = [
    ("wolf", "goat"),
    ("goat", "cabbage"),
]


class BankState:
    def __init__(self):
        self.present: Set[str] = set()
        self.procs: Dict[str, subprocess.Popen] = {}
        self.lock = asyncio.Lock()

    def _spawn(self, name: str):
        p = self.procs.get(name)
        if p is not None and p.poll() is None:
            return
        self.procs[name] = subprocess.Popen(["python", "-u", "character.py", name])

    def _kill(self, name: str):
        p = self.procs.get(name)
        if not p:
            return
        if p.poll() is None:
            try:
                p.terminate()
            except Exception:
                pass

    def snapshot_line(self) -> str:
        return f"STATE bank={BANK_NAME} present={','.join(sorted(self.present))}"


STATE = BankState()


async def send_peer_event(line: str):
    # messaggio tra container sulla Docker network
    if not PEER_HOST:
        return
    try:
        reader, writer = await asyncio.open_connection(PEER_HOST, PEER_PORT)
        writer.write((line.strip() + "\n").encode())
        await writer.drain()
        writer.close()
        await writer.wait_closed()
    except Exception:
        # non blocchiamo la simulazione se il peer non risponde
        return


def unsafe_outcome(present: Set[str]) -> tuple[str, str] | None:
    if "farmer" in present:
        return None
    for predator, prey in PREDATION:
        if predator in present and prey in present:
            return predator, prey
    return None


async def apply_rules_and_maybe_eat() -> str:
    outcome = unsafe_outcome(STATE.present)
    if not outcome:
        return "OK"

    predator, prey = outcome

    # evento su rete
    event_line = f"EVENT EAT predator={predator} prey={prey} at={BANK_NAME}"
    await send_peer_event(event_line)

    # mangiare = kill del processo-preda
    if prey in STATE.present:
        STATE.present.remove(prey)
    STATE._kill(prey)

    return f"EATEN {prey} by {predator}"


async def handle_command(line: str) -> str:
    parts = line.strip().split()
    if not parts:
        return "ERR empty"

    cmd = parts[0].upper()

    async with STATE.lock:
        if cmd == "PING":
            return "PONG"

        if cmd == "STATE":
            return STATE.snapshot_line()

        if cmd == "SPAWN":
            names = [p.lower() for p in parts[1:]]
            for n in names:
                STATE.present.add(n)
                STATE._spawn(n)
            res = await apply_rules_and_maybe_eat()
            return f"OK SPAWN {','.join(names)} | {res}"

        if cmd == "REMOVE":
            names = [p.lower() for p in parts[1:]]
            for n in names:
                if n in STATE.present:
                    STATE.present.remove(n)
                STATE._kill(n)
            res = await apply_rules_and_maybe_eat()
            return f"OK REMOVE {','.join(names)} | {res}"

        if cmd == "EVENT":
            # ricezione eventi dal peer (solo ack)
            return "OK EVENT_ACK"

        return "ERR unknown_cmd"


async def client_handler(reader: asyncio.StreamReader, writer: asyncio.StreamWriter):
    try:
        data = await reader.readline()
        line = data.decode(errors="ignore").strip()
        resp = await handle_command(line)
        writer.write((resp + "\n").encode())
        await writer.drain()
    finally:
        writer.close()
        await writer.wait_closed()


async def main():
    async with STATE.lock:
        for c in INIT_CHARACTERS:
            STATE.present.add(c)
            STATE._spawn(c)

    server = await asyncio.start_server(client_handler, host="0.0.0.0", port=LISTEN_PORT)
    sockets = server.sockets or []
    addrs = ", ".join(str(s.getsockname()) for s in sockets)
    print(f"[{BANK_NAME}] listening on {addrs}", flush=True)

    async with server:
        await server.serve_forever()


if __name__ == "__main__":
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        pass

