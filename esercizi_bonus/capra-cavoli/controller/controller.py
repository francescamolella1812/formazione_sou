import os
import socket

LEFT_HOST = os.environ.get("LEFT_HOST", "left")
RIGHT_HOST = os.environ.get("RIGHT_HOST", "right")
PORT = int(os.environ.get("PORT", "5000"))

ALL = {"farmer", "wolf", "goat", "cabbage"}


def rpc(host: str, line: str) -> str:
    with socket.create_connection((host, PORT), timeout=3.0) as s:
        s.sendall((line.strip() + "\n").encode())
        data = b""
        while not data.endswith(b"\n"):
            chunk = s.recv(4096)
            if not chunk:
                break
            data += chunk
    return data.decode(errors="ignore").strip()


def parse_present(line: str) -> set[str]:
    # "STATE bank=LEFT present=a,b,c"
    if "present=" not in line:
        return set()
    present_part = line.split("present=", 1)[1].strip()
    if not present_part:
        return set()
    return {x for x in present_part.split(",") if x}


def state_lines():
    l = rpc(LEFT_HOST, "STATE")
    r = rpc(RIGHT_HOST, "STATE")
    return l, r


def move(src_host: str, dst_host: str, names: list[str]):
    resp1 = rpc(src_host, "REMOVE " + " ".join(names))
    resp2 = rpc(dst_host, "SPAWN " + " ".join(names))
    return resp1, resp2


def main():
    print("=== CAPRA & CAVOLI (containers=sponde, processi=personaggi) ===")
    print("Comandi: show | go [wolf|goat|cabbage|none] | quit")
    print("Regola barca: farmer + (0 o 1 passeggero)\n")

    farmer_side = "L"  # iniziale a sinistra

    while True:
        cmd = input("> ").strip().lower()

        if cmd in ("q", "quit", "exit"):
            return

        if cmd in ("s", "show", "state"):
            l, r = state_lines()
            print(l)
            print(r)
            continue

        if cmd.startswith("go "):
            passenger = cmd.split(maxsplit=1)[1].strip()
            if passenger == "none":
                passenger = None
            elif passenger not in ("wolf", "goat", "cabbage"):
                print("Passeggero non valido. Usa: wolf|goat|cabbage|none")
                continue

            l_line, r_line = state_lines()
            L = parse_present(l_line)
            R = parse_present(r_line)

            if farmer_side == "L":
                src_host, dst_host = LEFT_HOST, RIGHT_HOST
                src_set = L
            else:
                src_host, dst_host = RIGHT_HOST, LEFT_HOST
                src_set = R

            if "farmer" not in src_set:
                print("ERRORE: farmer non è sulla sponda di partenza. Fai 'show'.")
                continue

            names = ["farmer"]
            if passenger:
                if passenger not in src_set:
                    print(f"ERRORE: {passenger} non è sulla sponda di partenza.")
                    continue
                names.append(passenger)

            resp1, resp2 = move(src_host, dst_host, names)
            print(resp1)
            print(resp2)

            farmer_side = "R" if farmer_side == "L" else "L"

            l_line, r_line = state_lines()
            L = parse_present(l_line)
            R = parse_present(r_line)

            if R.issuperset(ALL):
                print("\n Vittoria: tutti sulla destra!")
                return

            remaining = L.union(R)
            if remaining != ALL:
                missing = ALL - remaining
                print(f"\n Partita finita: mancano {', '.join(sorted(missing))} (mangiati).")
                return

            continue

        print("Comando non riconosciuto. Usa: show | go wolf|goat|cabbage|none | quit")


if __name__ == "__main__":
    main()

