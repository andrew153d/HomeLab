
#!/bin/bash


# Usage: ./deploy.sh <directory> <remote_user> <remote_ip> [--ssh]

if [ "$#" -lt 3 ] || [ "$#" -gt 4 ]; then
	echo "Usage: $0 <directory> <remote_user> <remote_ip> [--ssh]"
	exit 1
fi


DIR="$1"
USER="$2"
IP="$3"
SSH_FLAG="$4"

# Transfer the directory to the remote user's home directory using rsync
rsync -av --progress "$DIR" "${USER}@${IP}:~/"

# SSH into the remote machine only if --ssh is provided
if [ "$SSH_FLAG" = "--ssh" ]; then
	ssh "${USER}@${IP}"
fi
