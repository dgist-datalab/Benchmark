#!/bin/bash

MOUNT_PATH=/media/robusta

USER=root
PASSWORD=191066

RED='\033[0;31m'
NC='\033[0m'

echo "[CLEAN] Cleaning MySQL..."
sudo mysql --user=$USER --password=$PASSWORD < ./mysql/delete.sql
sudo service mysql stop
