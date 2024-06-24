#!/usr/bin/env bash

if command -v brew &>/dev/null; then
	brew install --cask font-jetbrains-mono
fi

if command -v apt &>/dev/null; then
	sudo apt install fonts-jetbrains-mono
fi
