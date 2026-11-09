#!/usr/bin/env bash
# The "application": answers with its name and version. Stands in for a real service.
set -euo pipefail
version=$(cat "$(dirname "$0")/VERSION" 2>/dev/null || echo dev)
greet() {
  local msg="${1:-hello}"
  [ -n "${msg// }" ] || msg="hello"
  echo "worker ${version}: ${msg}"
}
if [ "${BASH_SOURCE[0]}" = "$0" ]; then greet "$@"; fi
