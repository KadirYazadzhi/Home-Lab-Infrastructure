#!/bin/bash

# Configuration
BACKUP_ROOT="/mnt/hdd_1tb/backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
DIRECTORIES_TO_BACKUP=(
    "./infrastructure/docker-compose/01-network/openvpn-data"
    "./infrastructure/docker-compose/03-development/gitea_data"
    "./infrastructure/docker-compose/06-media/jellyfin/config"
)

# Ensure backup dir exists
mkdir -p "$BACKUP_ROOT"

echo "Starting Backup Job: $TIMESTAMP"

# Loop through dirs
for DIR in "${DIRECTORIES_TO_BACKUP[@]}"; do
    if [ -d "$DIR" ]; then
        SERVICE_NAME=$(basename $(dirname "$DIR"))
        ARCHIVE_NAME="backup_${SERVICE_NAME}_${TIMESTAMP}.tar.gz"
        
        echo "Backing up $SERVICE_NAME..."
        
        # 1. Stop container (Optional but recommended for DBs)
        # docker-compose -f ... stop
        
        # 2. Archive
        tar -czf "$BACKUP_ROOT/$ARCHIVE_NAME" "$DIR"
        
        # 3. Start container
        # docker-compose -f ... start
        
        echo "Saved to $BACKUP_ROOT/$ARCHIVE_NAME"
    else
        echo "Warning: Directory $DIR not found, skipping."
    fi
done

# Cleanup old backups (older than 7 days)
find "$BACKUP_ROOT" -name "*.tar.gz" -type f -mtime +7 -delete

echo "Backup Complete!"
