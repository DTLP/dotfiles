#!/usr/bin/env bash

# Define variables
URL="https://github.com/Wilfred/difftastic/releases/download/0.61.0/difft-x86_64-unknown-linux-gnu.tar.gz"
FILENAME="difft-x86_64-unknown-linux-gnu.tar.gz"

# Download the latest binary
sudo curl -L ${URL} -o ${FILENAME}

# Extract the archive
sudo tar -C /usr/local/bin/ -xzf ${FILENAME}

# Verify installation
difft --version

# Clean up
sudo rm ${FILENAME}
