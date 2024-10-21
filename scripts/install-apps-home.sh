#!/usr/bin/env bash

apt_apps=(
	# gaming
	steam

	# security
	keepass2

	# terminal
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
	io.github.zen_browser.zen
)

YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# apt
for app in "${apt_apps[@]}"; do
	echo -e "- Installing ${YELLOW}${app}${NC} ..."
	sudo apt install "${app}" -y
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
