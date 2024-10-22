#!/usr/bin/env bash

# Remove any previous Docker installation
for PKG in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do
  sudo apt-get remove ${PKG}
done

# Install Prerequisites
sudo apt install apt-transport-https ca-certificates curl -y

# Add Docker’s GPG Repo Key
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

# Add the Docker Repo
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" |
  sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

# Refresh package list
sudo apt update

# Install Docker
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Verify the Docker Installation
sudo systemctl is-active docker

sudo docker ps -a
