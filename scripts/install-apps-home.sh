#!/usr/bin/env bash

apt_apps=(
  # email
  thunderbird

  # gaming
  steam

  # tools
  ansible
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
  org.jeffvli.feishin
  com.spotify.Client
  org.videolan.VLC

  # gaming
  com.discordapp.Discord
  com.github.Matoking.protontricks
  com.mojang.Minecraft
  dev.lizardbyte.app.Sunshine
  net.davidotek.pupgui2 # ProtonUp-Qt

  # tools
  com.obsproject.Studio
  com.slack.Slack
  io.ente.photos
  org.keepassxc.KeePassXC

  # web
  com.brave.Browser
  com.opera.Opera
  com.vivaldi.Vivaldi
  io.github.zen_browser.zen
)

other_apps=(
  dropbox
  talhelper
  telegram
  terraform
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
  flatpak install --user flathub ${app} -y
done

# other apps
for app in "${other_apps[@]}"; do
  echo -e "- Installing ${YELLOW}${app}${NC} ..."
  ./tools/${app}.sh
done
