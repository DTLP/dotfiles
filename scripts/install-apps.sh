#!/usr/bin/env bash

apt_apps=(
	# gaming
	steam

	# package management
	npm
	snapd

	# security
	keepass2

	# terminal
	ldnsutils
	# brew install ldns // drill
)

snap_apps=(
	# containers
	docker
	kubectl

	# entertainment
	spotify

	# gaming
	discord

	# messaging
	telegram-desktop

	# note taking
	obsidian

	# programming
	go

	# terminal
	alacritty
	htop
	nvim
	tmux

	# web browsing
	opera
	ripgrep
)

go_packages=(
	github.com/uw-labs/strongbox@v1.1.0
)

YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# apt apps
for app in "${apt_apps[@]}"; do
	echo -e "- Installing ${YELLOW}${app}${NC} ..."
	sudo apt install "${app}" -y
done

# snap apps
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
