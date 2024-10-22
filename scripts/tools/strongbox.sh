#!/usr/bin/env bash

# Define variables
URL="github.com/uw-labs/strongbox@v1.1.0"

# Install thet package
go install ${URL}

# Edit global Git config to enable Strongbox filter and diff configuration
strongbox -git-config
