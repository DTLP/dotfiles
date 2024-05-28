#!/bin/bash

HOME_DIR="${HOME}"
DOTFILES_DIR="$(dirname $(pwd))"

CONFIG_DIRS=(
	".config/nvim"
	".config/alacritty"
	".kube"
	".vim"
)

CONFIG_FILES=(
	".bashrc"
	".git-prompt.sh"
	".gitignore_global"
	".prettierrc.json"
	".tmux.conf"
)

for dir in "${CONFIG_DIRS[@]}"; do
	ln -sf "${DOTFILES_DIR}/${dir}" "${HOME_DIR}/$(dirname ${dir})"
done

for file in "${CONFIG_FILES[@]}"; do
	ln -sf "${DOTFILES_DIR}/${file}" "${HOME_DIR}/${file}"
done

echo "All done!"
