#!/usr/bin/env bash
# Re-render all Mermaid diagrams under img/diagrams/ to SVG.
# Usage: ./render_diagrams.sh                 # render everything
#        ./render_diagrams.sh layers          # render a single diagram
set -euo pipefail
cd "$(dirname "$0")"

shopt -s nullglob
target="${1:-}"

for mmd in img/diagrams/*.mmd; do
  name="$(basename "${mmd%.mmd}")"
  [[ -n "$target" && "$target" != "$name" ]] && continue
  out="${mmd%.mmd}.svg"
  echo "→ $mmd  →  $out"
  npx --yes @mermaid-js/mermaid-cli -i "$mmd" -o "$out" -b transparent --quiet
done
