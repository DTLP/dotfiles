#!/usr/bin/env bash

set -euo pipefail

mkdir -p "$HOME/.kube" "$HOME/.talos"

if command -v kubectl &>/dev/null; then
  kubectl completion bash > "$HOME/.kube/kubectl_autocompletion"
  echo "kubectl completion written to ~/.kube/kubectl_autocompletion"
else
  echo "kubectl not found, skipping" >&2
fi

if command -v talosctl &>/dev/null; then
  talosctl completion bash > "$HOME/.talos/talosctl_autocompletion"
  echo "talosctl completion written to ~/.talos/talosctl_autocompletion"
else
  echo "talosctl not found, skipping" >&2
fi
