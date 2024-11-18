#!/usr/bin/env bash

# Define variables
URL="https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"

# Download the binary
curl -s ${URL} | bash

# Install kustomize
sudo mv kustomize /usr/local/bin/kustomize

# Verify installation
kustomize version
