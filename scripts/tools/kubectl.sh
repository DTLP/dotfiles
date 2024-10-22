#!/usr/bin/env bash

# Define variables
URL="https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz"
FILENAME="nvim-linux64.tar.gz"

# Download the archive
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Install kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Clean up
rm ./kubectl

# Verify installation
kubectl version --client
