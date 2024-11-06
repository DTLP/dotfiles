#!/usr/bin/env bash

apt_apps=(
  # email
  thunderbird

  # gaming
  steam

  # tools
  caffeine
  keepass2
  plocate

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

  # web
  com.opera.Opera
  com.vivaldi.Vivaldi
  io.github.zen_browser.zen
)

other_apps=(
  dropbox
  telegram
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

# other apps
for app in "${other_apps[@]"; do
  echo -e "- Installing ${YELLOW}${app}${NC} ..."
  ./tools/${app}.sh
done
