#!/usr/bin/env bash

# Gnome Tweaks
if ! command -v gnome-tweaks &>/dev/null; then
  sudo apt install gnome-tweaks -y
fi
mkdir -p ~/.themes/
mkdir -p ~/.icons/

cd ~/Downloads/

# Open Bar by x10shun
curl -Lo \
  openbarneuromorph.v41.shell-extension.zip \
  https://extensions.gnome.org/extension-data/openbarneuromorph.v41.shell-extension.zip
gnome-extensions install openbarneuromorph.v41.shell-extension.zip
rm openbarneuromorph.v41.shell-extension.zip

# Sound Input & Output Device Chooser by kgshank
curl -Lo \
  sound-output-device-chooserkgshank.net.v41.shell-extension.zip \
  https://extensions.gnome.org/extension-data/sound-output-device-chooserkgshank.net.v41.shell-extension.zip
gnome-extensions install sound-output-device-chooserkgshank.net.v41.shell-extension.zip
rm sound-output-device-chooserkgshank.net.v41.shell-extension.zip

echo -e "\
------------------------------\n\
Manual steps:
1. Log out and log back in \n\
2. Open up 'Extensions' \n\
3. Enable manually installed extensions \n\
"
