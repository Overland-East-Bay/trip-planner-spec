#!/usr/bin/env bash
set -euo pipefail

OPENAPI_FILE="${1:-openapi/openapi.yaml}"

err() {
  printf "ERROR: %s\n" "$1" >&2
}

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OPENAPI_PATH="${REPO_ROOT}/${OPENAPI_FILE}"

if [[ ! -f "${OPENAPI_PATH}" ]]; then
  err "OpenAPI spec not found: ${OPENAPI_FILE}"
  exit 1
fi

if ! command -v go >/dev/null 2>&1; then
  err "go is required to validate OpenAPI (install Go, or run this in CI)."
  exit 1
fi

(
  cd "${REPO_ROOT}/tools/openapi-validate"
  go run . "${OPENAPI_PATH}"
)


