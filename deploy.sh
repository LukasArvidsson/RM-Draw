#!/usr/bin/env bash
# Copy my floating toolbar onto the reMarkable and restart xovi.
# Usage: ./deploy.sh [host]   (default host: 10.11.99.1, the USB address)
# Override the firmware folder with FW=3.29 ./deploy.sh
set -euo pipefail

HOST="${1:-10.11.99.1}"
FW="${FW:-3.28}"
QMD_DIR=/home/root/xovi/exthome/qt-resource-rebuilder
SRC="$(dirname "$0")/$FW/floating.qmd"

[ -f "$SRC" ] || { echo "No $SRC found" >&2; exit 1; }

echo "Copying $SRC to root@$HOST:$QMD_DIR/"
scp "$SRC" "root@$HOST:$QMD_DIR/floating.qmd"

echo "Restarting xovi..."
# xovi installs its own start script; fall back to restarting xochitl.
ssh "root@$HOST" '
  if [ -x /home/root/xovi/start ]; then /home/root/xovi/start
  else systemctl restart xochitl; fi
' >/dev/null 2>&1 || true
echo "Done. The toolbar reloads once the UI is back."
