#!/bin/bash

HOME_DIR="${HOME}"
DOTFILES_DIR="$(dirname $(pwd))"

CONFIG_FILES=(
	".config/nvim"
	".config/alacritty"
	".kube/kubectl_autocompletion"
	".vim"
	".bashrc"
	".git-prompt.sh"
	".gitignore_global"
	".prettierrc.json"
	".tmux.conf"
)

for file in "${CONFIG_FILES[@]}"; do
	rm -rf "${HOME_DIR}/${file}"

	ln -s "${DOTFILES_DIR}/${file}" "${HOME_DIR}/${file}"
done

echo "All done!"
