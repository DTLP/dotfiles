#!/usr/bin/env bash

# Define variables
URL="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz"
FILENAME="nvim-linux-x86_64.tar.gz"

# Download the archive
curl -LO ${URL}

# Remove any previous nvim installation
sudo rm -rf /opt/nvim*

# Extract the archive
sudo tar -C /opt -xzf ${FILENAME}

# Clean up
rm ${FILENAME}

echo "Do not forget to add this line to ~/.bashrc:"
echo 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin"'
