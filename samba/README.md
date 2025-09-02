# Samba Docker Compose Setup

This directory contains a `docker-compose.yml` file for running a Samba server in a Docker container. Samba is an open-source implementation of the SMB/CIFS networking protocol, allowing file sharing between Linux/Unix and Windows systems.

## Overview

The provided `docker-compose.yml` uses the [dperson/samba](https://hub.docker.com/r/dperson/samba) image to quickly deploy a Samba server. This setup is ideal for sharing directories from your host machine with other devices on your local network.

## Services

### samba
- **Image:** `dperson/samba`
- **Container Name:** `samba`
- **Restart Policy:** `unless-stopped`
- **Environment Variables:**
  - `TZ=EST` (Sets the timezone to Eastern Standard Time)
- **Ports Exposed:**
  - `139:139` (NetBIOS Session Service)
  - `445:445` (SMB over TCP)
- **Volumes:**
  - `/media/ubuntu22/H:/mount/sharenado` (Mounts a host directory into the container)
- **Command:**
  - `-s sharenado;/mount/sharenado` (Creates a share named `sharenado` pointing to `/mount/sharenado`)

## Usage

1. **Edit the Volume Path:**
   - Update the volume path `/media/ubuntu22/H:/mount/sharenado` in `docker-compose.yml` to match the directory you want to share from your host.

2. **Start the Samba Server:**
   ```sh
   docker-compose up -d
   ```

3. **Access the Share:**
   - On Windows, open File Explorer and enter: `\\<host-ip>\sharenado`
   - On Linux, use a file manager or mount with `smbclient` or `mount.cifs`.

4. **Stop the Server:**
   ```sh
   docker-compose down
   ```

## Customization
- To add more shares, modify the `command` section in `docker-compose.yml`.
- For advanced configuration (users, passwords, permissions), refer to the [dperson/samba documentation](https://github.com/dperson/samba).

## Security Note
This configuration exposes Samba to your local network. For production or sensitive environments, review and restrict access as needed.

---

**Example `docker-compose.yml`:**

```yaml
services:
  samba:
    image: dperson/samba
    container_name: samba
    restart: unless-stopped
    environment:
      - TZ=EST
    ports:
      - "139:139"
      - "445:445"
    volumes:
      - /media/ubuntu22/H:/mount/sharenado
    command: ["-s", "sharenado;/mount/sharenado"]
```
