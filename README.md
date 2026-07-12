# tailscale-anywhere
Install and run Tailscale without root access.

## Usage

```bash
curl -fsSL https://raw.githubusercontent.com/User-Howard/tailscale-anywhere/refs/heads/main/install.sh | bash
```

## How it works

Uses Tailscale's userspace networking mode — no TUN interface, no sudo needed.

## Note

Traffic to other Tailscale nodes requires a SOCKS5 proxy:

```bash
ALL_PROXY=socks5://localhost:1055 curl http://100.x.x.x:port
```

To restart after reboot:

```bash
~/.tailscale/start.sh
```
