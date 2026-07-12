#!/bin/bash
set -e

# Stop only our daemon (via socket)
if [ -S "$HOME/.tailscale/tailscaled.sock" ]; then
    ~/.tailscale/tailscale --socket=$HOME/.tailscale/tailscaled.sock logout
fi

# Kill only the tailscaled using our state file
pkill -f "tailscaled.*$HOME/.tailscale/tailscaled.state" || true

# Remove files
rm -rf ~/.tailscale
echo "~/.tailscale removed"
