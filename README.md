# tailscale-anywhere

Install and run Tailscale without root access.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/User-Howard/tailscale-anywhere/refs/heads/main/install.sh | bash
```

## Uninstall

```bash
curl -fsSL https://raw.githubusercontent.com/User-Howard/tailscale-anywhere/refs/heads/main/uninstall.sh | bash
```

## Restart after reboot

```bash
~/.tailscale/start.sh
```

## How it works

Uses Tailscale's userspace networking mode — no TUN interface, no sudo needed.
Works on shared servers or any machine you don't have root on.

## Note

Traffic to other Tailscale nodes requires a SOCKS5 proxy:

```bash
ALL_PROXY=socks5://localhost:1055 curl http://100.x.x.x:port
```
