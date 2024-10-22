#!/usr/bin/env bash

# Define variables
URL="https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz"
FILENAME="nvim-linux64.tar.gz"

# Install dependencies
sudo apt install libgtk2.0-0 libgtk-3-0 libnotify4 libnss3 libxss1 libasound2 -y

# Install Dropbox
sudo apt install nautilus-dropbox -y
