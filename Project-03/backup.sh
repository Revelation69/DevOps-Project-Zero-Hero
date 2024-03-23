#!/bin/bash

# Enable debugging mode
set -x

# Define source and destination directories
SRC_DIR="/home/ubuntu/Users"
DEST_HOST="ubuntu@3.93.45.234"
DEST_DIR="/home/ubuntu/backup"

# Rsync command to synchronize files and directories
rsync -avz --delete "$SRC_DIR" "$DEST_HOST":"$DEST_DIR"

# Check rsync exit status
if [ $? -eq 0 ]; then
    echo "Backup completed successfully."
    # Add email notification function here if needed
else
    echo "Backup failed!"
    # Add email notification function here if needed
fi

