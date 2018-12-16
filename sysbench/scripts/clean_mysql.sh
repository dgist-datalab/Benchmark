#!/bin/bash

source global.sh

echo "[CLEAN] Cleaning MySQL..."
sudo mysql --user=$USER --password=$PASSWORD < ../mysql/delete.sql
sudo service mysql stop

echo "[CLEAN] Reset alias table"
sudo mv -f /etc/apparmor.d/tunables/alias.old /etc/apparmor.d/tunables/alias
