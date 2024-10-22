#!/usr/bin/env bash

# Define variables
URL="https://github.com/tmux/tmux/releases/download/3.5a/tmux-3.5a.tar.gz"
FILENAME="tmux-3.5a.tar.gz"
DIRNAME="tmux-3.5a"

# Install dependencies
sudo apt update
sudo apt install -y wget tar gcc make libevent-dev libncurses-dev bison

# Download the archive
wget $URL -O $FILENAME

# Extract the archive
tar -xzf $FILENAME

# Navigate to the extracted directory
cd $DIRNAME

# Configure, compile, and install
./configure
make
sudo make install

# Clean up
cd ..
rm -rf $FILENAME $DIRNAME

# Confirm installation
tmux -V
