## Dockerdaryl (Ubuntu Server)

- **IP Address:** `192.168.1.185`
- **Purpose:** Ubuntu Server intended to run Docker containers

## AdGuard Home prerequisite (Ubuntu + systemd-resolved)

AdGuard Home needs to bind to DNS port **53** on the host. On Ubuntu Server, `systemd-resolved` often runs a local DNS *stub listener* that can conflict with Docker publishing `53:53`.

If the AdGuard container fails to start with an error like `bind: address already in use` on port 53, disable the stub listener:

1) Edit:

- `/etc/systemd/resolved.conf`

2) Set (under `[Resolve]`):

- `DNSStubListener=no`

3) Restart `systemd-resolved`:

```sh
sudo systemctl restart systemd-resolved
```

4) Verify port 53 is now free on the host:

```sh
sudo ss -lnup | grep -E ':(53)\b'
```

#### Notes / troubleshooting

- After changing `systemd-resolved` behavior, ensure the host itself can still resolve DNS (for `apt`, etc.). Ubuntu commonly manages `/etc/resolv.conf` as a symlink; if name resolution breaks, check where it points with:

```sh
readlink -f /etc/resolv.conf
```

- To roll back, set `DNSStubListener=yes` and restart `systemd-resolved`.