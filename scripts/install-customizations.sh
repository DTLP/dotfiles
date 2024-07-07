#!/usr/bin/env bash

# Gnome Tweaks
if ! command -v gnome-tweaks &>/dev/null; then
	sudo apt install gnome-tweaks -y
fi
mkdir -p ~/.themes/
mkdir -p ~/.icons/

# Dracula theme
curl -LO https://github.com/dracula/gtk/archive/master.zip
unzip master.zip -d ~/.themes/
rm master.zip
mv ~/.themes/gtk-master/ ~/.themes/Dracula

# Flatery icons
curl -L -o Flatery-Black.zip https://github.com/cbrnix/Flatery/archive/refs/heads/master.zip
unzip Flatery-Black.zip
mv Flatery-master/Flatery-Black-Dark ~/.icons/Flatery-Black-Dark
mv Flatery-master/Flatery-Dark ~/.icons/Flatery-Dark
rm -rf Flatery-master
rm Flatery-Black.zip

# Spotify - https://spicetify.app/docs/advanced-usage/installation/#note-for-linux-users
curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
curl -fsSL https://raw.githubusercontent.com/Astromations/Hazy/main/install.sh | sh

echo -e "\
------------------------------\n\
Manual steps:
1. Open up Tweaks / Appearance \n\
2. Set Applications and Shell to Dracula \n\
3. Set Icons to Flatery Black Dark \n\
\n\
Open Bar by x10shun \n\
1. Get extension from https://extensions.gnome.org/extension/6580/open-bar \n\
2. Access Open Bar settings through the Extensions \n\
3. Import config from configs/openbar \n\
"
