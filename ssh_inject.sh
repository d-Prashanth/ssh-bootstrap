#!/bin/bash

set -e

PUB_KEY="./.ssh/sshAllow"
USER="root"

HOST_FILE="./hosts.txt"
PASS_FILE="./passwords.txt"

# Check files exist
if [[ ! -f "$HOST_FILE" || ! -f "$PASS_FILE" ]]; then
    echo "HOSTList or HOSTPwd file not found!"
    exit 1
fi

# Open file descriptors
exec 3<"$HOST_FILE"
exec 4<"$PASS_FILE"

while read -u 3 HOST && read -u 4 PASS
do
    echo "Processing $HOST..."

    if sshpass -p "$PASS" ssh-copy-id -i "$PUB_KEY" -o StrictHostKeyChecking=no "$USER@$HOST" >/dev/null 2>&1
    then
        echo "Key copied to $HOST" 
    else
        echo "Failed for $HOST"
    fi
done

# Close file descriptors
exec 3<&-
exec 4<&-

echo "SSH key injection completed!"
echo "bye!"
