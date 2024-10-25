#!/usr/bin/env bash

# Define variables
LATEST=$(curl -s https://api.github.com/repos/telegramdesktop/tdesktop/releases/latest |
  jq '.html_url' |
  sed 's/.*tag\/v//; s/"//g')
FILENAME="tsetup.${LATEST}.tar.xz"
URL="https://github.com/telegramdesktop/tdesktop/releases/download/v${LATEST}/${FILENAME}"

# Download the archive
curl -LO ${URL}

# Remove any previous nvim installation
sudo rm -rf /opt/telegram

# Extract the archive
tar -xJvf ${FILENAME}

# Move to opt
sudo mv Telegram /opt/telegram

# Clean up
rm ${FILENAME}
