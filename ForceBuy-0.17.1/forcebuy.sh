#!/usr/bin/env bash
# Starts ForceBuy and opens it in your browser.
set -e
cd "$(dirname "$0")"

if ! command -v node >/dev/null 2>&1; then
  echo "ForceBuy needs Node.js 24 or newer. Install it from https://nodejs.org"
  exit 1
fi
NODE_MAJOR="$(node -p process.versions.node | cut -d. -f1)"
if [ "$NODE_MAJOR" -lt 24 ]; then
  echo "ForceBuy needs Node.js 24 or newer, and this is Node $NODE_MAJOR. Update it from https://nodejs.org"
  exit 1
fi

( sleep 1;
  if command -v open >/dev/null 2>&1; then open http://127.0.0.1:8787;
  elif command -v xdg-open >/dev/null 2>&1; then xdg-open http://127.0.0.1:8787;
  fi ) &

exec node forcebuy.mjs
