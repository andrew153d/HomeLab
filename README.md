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
