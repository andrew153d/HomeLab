## Installing Docker

```sh
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
```

```sh
sudo apt update && sudo apt upgrade -y
```

```sh
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
newgrp docker
```
## Cloning only the nut directory

To clone only the `nut` folder from this repository:

```sh
rm -rf ~/HomeLab  # Remove any existing HomeLab directory in your home folder first
git clone --depth 1 --filter=blob:none --sparse https://github.com/andrew153d/HomeLab.git ~/HomeLab
cd ~/HomeLab
git sparse-checkout set nut
```

## Setup

1. Edit the configuration files in `nut/config` as needed for your UPS hardware and environment.
2. Start the NUT service with Docker Compose:

```sh
cd nut
sudo docker compose up -d
```

## Resources
- [Network UPS Tools Documentation](https://networkupstools.org/docs/user-manual.chunked/)
- [instantlinux/nut-upsd Docker Hub](https://hub.docker.com/r/instantlinux/nut-upsd)
