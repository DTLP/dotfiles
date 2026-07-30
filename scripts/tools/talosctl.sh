#!/usr/bin/env bash

[ -f /usr/local/bin/talosctl ] && rm /usr/local/bin/talosctl

curl -sL https://talos.dev/install | sh
