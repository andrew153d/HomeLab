
# NUT Docker Container for Raspberry Pi 3

This directory contains a Docker Compose setup for running [Network UPS Tools (NUT)](https://networkupstools.org/) on a Raspberry Pi 3. The container uses the `instantlinux/nut-upsd` image to monitor and manage UPS devices, exposing the NUT server on port 3493. It is pre-configured to work with USB-connected UPS hardware and is intended for ARM devices like the Raspberry Pi 3.

## What This Container Does

- Runs a NUT (Network UPS Tools) server inside a Docker container
- Monitors and manages UPS devices connected via USB
- Exposes the NUT upsd service on port 3493 for network access
- Persists configuration and state in local `config` and `data` directories
- Designed and tested for Raspberry Pi 3 (ARMv7/armhf)

## Usage

1. **Edit configuration:**
	- Update the files in `config/` (such as `nut.conf`, `ups.conf`, etc.) to match your UPS hardware and environment.
2. **Connect your UPS:**
	- Plug your UPS into the Raspberry Pi 3 via USB. The container is set up to pass through `/dev/hidraw0` (update this if your UPS uses a different device).
3. **Start the container:**
	- From this directory, run:
	  ```sh
	  sudo docker compose up -d
	  ```
4. **Access the NUT server:**
	- The NUT upsd service will be available on port 3493 of your Raspberry Pi.

## Requirements

- Raspberry Pi 3 running a compatible OS (e.g., Raspberry Pi OS)
- Docker and Docker Compose installed (see below)

---

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
git clone --depth 1 --filter=blob:none --sparse https://github.com/andrew153d/HomeLab.git ~/HomeLab
git sparse-checkout set nut

## Cloning only the nut-server directory

To clone only the `nut-server` folder from this repository:

```sh
rm -rf ~/HomeLab  # Remove any existing HomeLab directory in your home folder first
git clone --depth 1 --filter=blob:none --sparse https://github.com/andrew153d/HomeLab.git ~/HomeLab
cd ~/HomeLab
git sparse-checkout set nut-server
```


## Resources
- [Network UPS Tools Documentation](https://networkupstools.org/docs/user-manual.chunked/)
- [instantlinux/nut-upsd Docker Hub](https://hub.docker.com/r/instantlinux/nut-upsd)
