#!/bin/bash
# Keystroke-count loop from run_ulogme_osx.sh, split out so launchd can run it
# separately from the Python sniffer (which needs its own TCC permissions).
cd "$(dirname "$0")/.."
PYTHON="$(pwd)/.env/bin/python"
KEYSTROKE_RAW_FILE="$(pwd)/logs/keyfreqraw.txt"
mkdir -p logs
while true; do
  sleep 9
  touch $KEYSTROKE_RAW_FILE
  num=$(wc -l < $KEYSTROKE_RAW_FILE)
  KEYSTROKE_FILE="$(pwd)/logs/keyfreq_$("$PYTHON" rewind7am.py).txt"
  echo "$(date +%s) $num"  >> $KEYSTROKE_FILE
  rm $KEYSTROKE_RAW_FILE
done
