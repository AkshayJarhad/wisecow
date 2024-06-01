#!/bin/bash

# Directory to backup
DIR_TO_BACKUP="/path/to/directory"
# Backup destination
BACKUP_DEST="/path/to/backup"

# Create backup
rsync -av --delete $DIR_TO_BACKUP $BACKUP_DEST

if [ $? -eq 0 ]; then
  echo "Backup successful!"
else
  echo "Backup failed!"
fi
