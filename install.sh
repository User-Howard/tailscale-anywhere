#!/bin/bash
set -e

# Detect architecture
ARCH=$(uname -m)
case $ARCH in
  x86_64)  TSARCH="amd64" ;;
  aarch64) TSARCH="arm64" ;;
  armv7l)  TSARCH="arm"   ;;
  *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
esac

# Download Tailscale
mkdir -p ~/.tailscale
cd ~/.tailscale
curl -fsSL "https://pkgs.tailscale.com/stable/tailscale_latest_${TSARCH}.tgz" -o tailscale.tgz
tar -xzf tailscale.tgz --strip-components=1
rm tailscale.tgz

# Create start.sh
cat > ~/.tailscale/start.sh << 'EOF'
#!/bin/bash
set -e
cd ~/.tailscale
./tailscaled \
  --tun=userspace-networking \
  --socket=$HOME/.tailscale/tailscaled.sock \
  --state=$HOME/.tailscale/tailscaled.state \
  >~/.tailscale/tailscaled.log 2>&1 &
sleep 2
./tailscale --socket=$HOME/.tailscale/tailscaled.sock status
EOF
chmod +x ~/.tailscale/start.sh

# Start and connect
~/.tailscale/start.sh
./tailscale --socket=$HOME/.tailscale/tailscaled.sock up
