# Samba Docker Compose (Simple)

This directory contains a simple `docker-compose.yml` for running a Samba server and Portainer agent.

## Samba Service
- Uses the `dockurr/samba` image
- Shares the `./samba` folder on your host as `\\<host-ip>\Data`
- Default user: `samba`, password: `secret`
- Port: `445` (SMB)

## Usage
1. Place files to share in the `samba` folder.
2. Start the services:
   ```sh
   docker-compose up -d
   ```
3. Access the share from another machine:
   - Windows: `\\<host-ip>\ShareNado`
   - Linux: Use a file manager or `mount.cifs`.
   - Ubuntu: Use file manager and connect to `smb://<host-ip>/ShareNado`
4. Stop the services:
   ```sh
   docker-compose down
   ```

## References
- https://github.com/dockur/samba
