#!/usr/bin/env bash

# Define variables
VERSION="$(curl -s https://api.github.com/repos/budimanjojo/talhelper/releases/latest | grep '"tag_name"' | cut -d '"' -f4)"
URL="https://github.com/budimanjojo/talhelper/releases/download/${VERSION}/talhelper_linux_amd64.tar.gz"
FILENAME="talhelper_linux_amd64.tar.gz"

# Download the latest binary
sudo curl -L ${URL} -o ${FILENAME}

# Extract the archive
sudo tar -C /usr/local/bin/ -xzf ${FILENAME}

# Verify installation
talhelper --version

# Clean up
sudo rm ${FILENAME}
