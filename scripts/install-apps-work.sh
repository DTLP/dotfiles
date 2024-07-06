#!/usr/bin/env bash

apt_apps=(
	# package management
	npm
	snapd

	# programming
	python3-pip
	python3.10-venv

	# terminal
	ldnsutils
	# brew install ldns // drill
)

snap_apps=(
	# containers
	docker
	kubectl

	# programming
	go

	# terminal
	alacritty
	#helix
	htop
	nvim
	ripgrep
	tmux
)

go_packages=(
	github.com/uw-labs/strongbox@v1.1.0
)

YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# apt
for app in "${apt_apps[@]}"; do
	echo -e "- Installing ${YELLOW}${app}${NC} ..."
	sudo apt install "${app}" -y
done

# snap
for app in "${snap_apps[@]}"; do
	echo -e "- Installing ${YELLOW}${app}${NC} ..."
	if ! sudo snap install "${app}"; then
		sudo snap install "${app}" --classic
	fi
done

# go packages
for package in "${go_packages[@]}"; do
	echo -e "- Installing ${YELLOW}${package}${NC}"
	go install "${package}"
done
