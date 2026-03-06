#!/usr/bin/env bash

# Define variables
URL="https://github.com/mierak/rmpc/releases/download/v0.11.0/rmpc-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"
FILENAME="rmpc-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"

# Install dependencies
## mpd
sudo apt update
sudo apt install mpd
## ueberzurg for xUbuntu 22.04
## https://software.opensuse.org/download.html?project=home%3Ajustkidding&package=ueberzugpp
echo 'deb http://download.opensuse.org/repositories/home:/justkidding/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/home:justkidding.list
curl -fsSL https://download.opensuse.org/repositories/home:justkidding/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_justkidding.gpg >/dev/null
sudo apt update
sudo apt install ueberzugpp

# Enable mpd service
systemctl --user enable mpd
systemctl --user start mpd
systemctl --user status mpd

# Download the archive
wget $URL -O $FILENAME

# Extract the archive
tar -xzf $FILENAME

# Install rmpc and its extras
sudo install -m 755 rmpc /usr/local/bin/rmpc
sudo install -m 644 man/rmpc.1 /usr/local/share/man/man1/
sudo install -m 644 completions/rmpc.bash /etc/bash_completion.d/rmpc

# Clean up
rm -rf completions
rm -rf man
rm rmpc
rm $FILENAME
