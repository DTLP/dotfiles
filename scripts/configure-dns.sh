#!/usr/bin/env bash

set -euo pipefail

# Write resolver configuration
sudo tee /etc/systemd/resolved.conf >/dev/null <<'EOF'
[Resolve]
DNS=1.1.1.1#cloudflare-dns.com 1.0.0.1#cloudflare-dns.com 2606:4700:4700::1111#cloudflare-dns.com 2606:4700:4700::1001#cloudflare-dns.com
DNSSEC=yes
DNSOverTLS=yes
FallbackDNS=
EOF

# Ensure systemd stub resolver is used
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

# Apply changes
sudo systemctl restart systemd-resolved
