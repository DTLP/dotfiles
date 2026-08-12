#!/usr/bin/env bash

# Restore GNOME shell extensions and keybindings from dconf keyfiles
# previously exported by scripts/backup-gnome.sh.

set -euo pipefail

readonly IN_DIR="${1:-$(dirname "${BASH_SOURCE[0]}")/configs/gnome}"

for file in "${IN_DIR}"/extensions/*.dconf; do
  [[ -e "${file}" ]] || continue
  name="$(basename "${file}" .dconf)"
  dconf load "/org/gnome/shell/extensions/${name}/" <"${file}"
  echo "Restored ${name}"
done

if [[ -f "${IN_DIR}/wm-keybindings.dconf" ]]; then
  dconf load /org/gnome/desktop/wm/keybindings/ <"${IN_DIR}/wm-keybindings.dconf"
fi
if [[ -f "${IN_DIR}/shell-keybindings.dconf" ]]; then
  dconf load /org/gnome/shell/keybindings/ <"${IN_DIR}/shell-keybindings.dconf"
fi

echo "GNOME config restored from ${IN_DIR}"
