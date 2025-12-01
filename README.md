echo \

# HomeLab

A repository to store all backup information about my home lab.

---

## Network

- **Subnet:** `192.168.1.0/24`
  - All statically assigned IP addresses should be between `192.168.1.40-200`.

---

## Devices

List of every device on the network, their IPs, and the services they host:

- **ubuntu22**
    - OS: Ubuntu 22
    - IP: `192.168.1.174`
    - Samba: File sharing service

- **Larry**
    - IP: `192.168.1.182`
    - Local-AI: AI services and models



---

## Structure

Every service should ideally be hosted in a Docker container, with its configuration and data hosted outside of the container. This structure ensures that periodic backups of data and configuration for every service can be made and easily recovered if needed.

**Recommended Service Structure:**
```
Service_Name/
  docker-compose.yml
  data/
  config/
```

---

## Docker Installation

Remove conflicting packages
```sh
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
```

```sh
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

```sh
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin curl -y
sudo usermod -aG docker $USER
```
