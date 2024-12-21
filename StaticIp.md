- Place this in /etc/netplan/01-network-manager-all.yaml
```
network:
  version: 2
  renderer: NetworkManager
  ethernets:
        eth0:
            addresses:
                - 192.168.12.234/24
            nameservers:
                addresses: [8.8.8.8, 8.8.4.4]
            routes:
                - to: default
                  via: 192.168.12.1
```
sudo netplan apply
