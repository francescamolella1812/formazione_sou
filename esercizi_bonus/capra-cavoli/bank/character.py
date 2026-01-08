import os
import sys
import time
import signal

name = sys.argv[1] if len(sys.argv) > 1 else "unknown"

running = True

def handle_sigterm(signum, frame):
    global running
    running = False

signal.signal(signal.SIGTERM, handle_sigterm)

print(f"[CHAR] {name} started pid={os.getpid()}", flush=True)

while running:
    time.sleep(1.0)
    print(f"[CHAR] {name} alive pid={os.getpid()}", flush=True)

print(f"[CHAR] {name} exiting pid={os.getpid()}", flush=True)

