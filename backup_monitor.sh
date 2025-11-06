#!/bin/bash

#Setting up the variables
FILEPATH='/home/ec2-user/scripts/backups/db_backup_2024.sql'
ATTEMPT=1
DATE=$(date)

#Starting the script
echo "=========================="
echo "Starting the script: $DATE"
echo "=========================="

#If condition block to find the file
if [ -f "$FILEPATH" ]; then
        echo "Backup file already exists!"
else
       #While loop to loop through 20 attempts
        while [ $ATTEMPT -le 20 ] ; do
              echo "Attempt: $ATTEMPT -- File not found. Retrying"
              ATTEMPT=$((ATTEMPT + 1))
              if [ -f "$FILEPATH" ];then
                      echo "Attempt: $ATTEMPT -- Backup ready!"
              exit 0
              fi
              sleep 2s
        done
fi

#Ending the script
echo "=========================="
echo "Script Ending at: $DATE"
echo "=========================="