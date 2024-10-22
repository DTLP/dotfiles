#!/usr/bin/env bash

apt_apps=(
  # programming
  python3-pip
  python3.10-venv

  # terminal
  htop
  ldnsutils # brew install ldns // drill
  ripgrep
)

other_apps=(
  alacritty
  docker
  go
  kubectl
  nvim
  strongbox
  tmux
)

YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# apt
for app in "${apt_apps[@]}"; do
  echo -e "- Installing ${YELLOW}${app}${NC} ..."
  sudo apt install "${app}" -y
done

# other apps
for app in "${other_apps[@]"; do
  echo -e "- Installing ${YELLOW}${app}${NC} ..."
  ./tools/${app}.sh
done
