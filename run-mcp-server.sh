#!/usr/bin/env bash
set -euo pipefail

show_help() {
  cat <<'USAGE'
Run the MCP for Unity server.

Usage:
  ./run-mcp-server.sh [extra mcp-for-unity args]

Environment variables:
  UNITY_MCP_HTTP_URL      HTTP URL for Unity MCP endpoint (default: http://localhost:8080)
  UNITY_MCP_TRANSPORT     Transport type (default: http)
  UNITY_MCP_PACKAGE_SPEC  uvx package selector (default: mcpforunityserver>=0.0.0a0)
USAGE
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  show_help
  exit 0
fi

if ! command -v uvx >/dev/null 2>&1; then
  echo "Error: 'uvx' is not installed or not on PATH." >&2
  echo "Install uv first: https://docs.astral.sh/uv/getting-started/installation/" >&2
  exit 1
fi

HTTP_URL="${UNITY_MCP_HTTP_URL:-http://localhost:8080}"
TRANSPORT="${UNITY_MCP_TRANSPORT:-http}"
PACKAGE_SPEC="${UNITY_MCP_PACKAGE_SPEC:-mcpforunityserver>=0.0.0a0}"

exec uvx --prerelease explicit \
  --from "${PACKAGE_SPEC}" \
  mcp-for-unity \
  --transport "${TRANSPORT}" \
  --http-url "${HTTP_URL}" \
  --project-scoped-tools \
  "$@"
