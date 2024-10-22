#!/usr/bin/env bash

# Define variables
URL="https://go.dev/dl/go1.23.2.linux-amd64.tar.gz"
FILENAME="go1.23.2.linux-amd64.tar.gz"

# Download the archive
curl -LO ${URL}

# Remove any previous Go installation
rm -rf /usr/local/go

# Extract the archive
sudo tar -C /usr/local -xzf ${FILENAME}

echo "Do not forget to add this line to ~/.bashrc:"
echo 'export PATH=$PATH:/usr/local/go/bin'

# Clean up
rm ${FILENAME}

# Confirm installation
go version
