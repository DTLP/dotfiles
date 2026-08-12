#!/usr/bin/env bash

# Backup GNOME shell extensions and keybindings to dconf keyfiles.
# Restore with scripts/restore-gnome.sh.

set -euo pipefail

readonly OUT_DIR="${1:-$(dirname "${BASH_SOURCE[0]}")/configs/gnome}"
mkdir -p "${OUT_DIR}/extensions"

# dconf stores extension settings under /org/gnome/shell/extensions/<name>/,
# where <name> is the lowercased extension UUID. Enumerate the paths directly
# rather than deriving names from UUIDs to avoid case-mismatch misses.
exts="$(dconf list /org/gnome/shell/extensions/)"

while IFS= read -r name; do
  [[ -z "${name}" ]] && continue
  name="${name%/}"
  dconf dump "/org/gnome/shell/extensions/${name}/" >"${OUT_DIR}/extensions/${name}.dconf"
  echo "Backed up ${name}"
done <<<"${exts}"

dconf dump /org/gnome/desktop/wm/keybindings/ >"${OUT_DIR}/wm-keybindings.dconf"
dconf dump /org/gnome/shell/keybindings/ >"${OUT_DIR}/shell-keybindings.dconf"

echo "GNOME config written to ${OUT_DIR}"
