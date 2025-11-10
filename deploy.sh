

#!/bin/bash

# Enforce running with bash, not sh
if [ -z "$BASH_VERSION" ]; then
	echo "Error: This script must be run with bash, not sh. Use: bash $0 ..."
	exit 1
fi



# Usage: ./deploy.sh <directory> <remote_user> <remote_ip> [--ssh|--restart]


if [ "$#" -lt 3 ] || [ "$#" -gt 4 ]; then
	echo "Usage: $0 <directory> <remote_user> <remote_ip> [--ssh|--restart]"
	exit 1
fi


DIR="$1"
USER="$2"
IP="$3"

OPTION="$4"



# Check for sshpass
if ! command -v sshpass >/dev/null 2>&1; then
	echo "Error: sshpass is not installed. Please install it and try again."
	exit 1
fi

# Prompt for password once
read -s -p "Enter SSH password for ${USER}@${IP}: " SSHPASS
echo

# Transfer the directory to the remote user's home directory using rsync with sshpass
sshpass -p "$SSHPASS" rsync -av --progress "$DIR" "${USER}@${IP}:~/"


# SSH into the remote machine only if --ssh is provided
if [ "$OPTION" = "--ssh" ]; then
	sshpass -p "$SSHPASS" ssh "${USER}@${IP}"
fi


# If --restart is provided, run docker compose down/up in the directory on the remote machine
if [ "$OPTION" = "--restart" ]; then
	sshpass -p "$SSHPASS" ssh -t "${USER}@${IP}" "cd ~/${DIR} && sudo docker compose down && sudo docker compose up -d"
fi
