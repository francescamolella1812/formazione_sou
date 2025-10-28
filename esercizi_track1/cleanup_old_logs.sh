sudo tee /usr/local/sbin/cleanup_old_logs.sh >/dev/null <<'SH'
#!/usr/bin/env bash
set -euo pipefail

# Cartelle da pulire (aggiungine se serve)
TARGETS=(/var/log)

# Dry-run attivabile con CLEANUP_DRYRUN=1
DRYRUN="${CLEANUP_DRYRUN:-0}"

# Trova e (eventualmente) cancella file >30 giorni
if [[ "$DRYRUN" == "1" ]]; then
  find "${TARGETS[@]}" -xdev -type f -mtime +30 \
    -not -path "/var/log/journal/*" \
    -not -name "wtmp" -not -name "btmp" -not -name "lastlog" \
    -print
else
  find "${TARGETS[@]}" -xdev -type f -mtime +30 \
    -not -path "/var/log/journal/*" \
    -not -name "wtmp" -not -name "btmp" -not -name "lastlog" \
    -print -delete
fi
SH

sudo chmod +x /usr/local/sbin/cleanup_old_logs.sh

