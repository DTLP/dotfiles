#!/bin/bash

HOME_DIR="${HOME}"
DOTFILES_DIR="$(dirname $(pwd))"

CONFIG_DIRS=(
  ".config/mpd"
  ".config/rmpc"
  ".talos"
)

for dir in "${CONFIG_DIRS[@]}"; do
  ln -sf "${DOTFILES_DIR}/${dir}" "${HOME_DIR}/$(dirname ${dir})"
done

echo "All done!"
