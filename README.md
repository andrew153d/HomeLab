# HomeLab
A repo to store all backup information about my home lab

## Network
- subnet of 10.0.0.0/24
  - All statically assigned ip addresses should be between 10.0.0.40-100

## Devices
- Every device on the network, its ip, and the services they host
- PeppyPaul
    - Proxmox:port
    - 10.0.0.~
    - LudicriousLarry
      - Ubuntu 22
      - 10.0.0.~  
      - Ollama:port
      - OpenWebUI:port
    - BigBob
      - Ubuntu 22
      - 10.0.0.~
      - Dashy:8080
    - Haos
      - Home Assistant Operating System
      - 10.0.0.~
      - Home Assistant
    - 

## Structure 
- Every service should ideally be hosted in a docker container with its configration and data hosted outside of the container. This structure will ensure that perioic backups of data and configuration forevery service may be made and easily recovered should that be needed.
- Service_Name
  - docker-compose.yml
  - data
  - config

## Docker installation
- for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
- sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
- sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
