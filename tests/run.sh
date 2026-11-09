#!/usr/bin/env bash
# Unit tests (quality gate). A failing test blocks the pull request.
set -euo pipefail
cd "$(dirname "$0")/.."
# shellcheck source=/dev/null
source src/worker.sh
out=$(greet "ping")
[ "$out" = "worker dev: ping" ] || { echo "FAIL: greet returned '$out'"; exit 1; }
echo "ok: greet"
out=$(greet "   ")
[ "$out" = "worker dev: hello" ] || { echo "FAIL: blank message returned '$out'"; exit 1; }
echo "ok: blank message"
