#!/bin/bash
set -e

# Stop daemon
if pgrep -f tailscaled > /dev/null; then
    kill $(pgrep -f tailscaled)
    echo "tailscaled stopped"
fi

# Remove files
rm -rf ~/.tailscale
echo "~/.tailscale removed"
