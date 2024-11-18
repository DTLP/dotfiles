#!/usr/bin/env bash

# Define variables
URL="https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64"

# Download the latest binary
sudo curl -L ${URL} -o /usr/local/bin/yq

# Make it executable
sudo chmod +x /usr/local/bin/yq

# Verify installation
yq --version
