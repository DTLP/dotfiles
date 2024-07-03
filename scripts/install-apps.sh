#!/usr/bin/env bash

apt_apps=(
	# gaming
	steam

	# package management
	npm
	snapd

	# programming
	python3-pip
	python3.10-venv

	# security
	keepass2

	# terminal
	ldnsutils
	# brew install ldns // drill
	neofetch
)

flatpak_apps=(
	# documentation
	md.obsidian.Obsidian

	# entertainment
	com.spotify.Client

	# gaming
	com.discordapp.Discord

	# messaging
	org.telegram.desktop

	# web
	com.vivaldi.Vivaldi
)

snap_apps=(
	# containers
	docker
	kubectl

	# programming
	go

	# terminal
	alacritty
	helix
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

# flatpak
## Get repo file
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
## Reinstall ca-certificates
# sudo apt install --reinstall ca-certificates
## Get packages
for app in "${flatpak_apps[@]}"; do
	echo -e "- Installing ${YELLOW}${app}${NC} ..."
	sudo flatpak install flathub ${app} -y
done

# go packages
for package in "${go_packages[@]}"; do
	echo -e "- Installing ${YELLOW}${package}${NC}"
	go install "${package}"
done
