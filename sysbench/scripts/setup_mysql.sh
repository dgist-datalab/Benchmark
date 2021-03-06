#!/bin/bash

source global.sh

echo "[SETUP] Stopping MySQL daemon..."
sudo service mysql stop

echo "[SETUP] Set alias to avoid apparmor"
sudo cp /etc/apparmor.d/tunables/alias /etc/apparmor.d/tunables/alias.old
sudo echo "alias /var/lib/mysql/ -> $MOUNT_PATH/mysql/," >> /etc/apparmor.d/tunables/alias
sudo service apparmor reload

echo "[SETUP] Clone the original @datadir to $MOUNT_PATH/mysql"
sudo mkdir -p $MOUNT_PATH/mysql

if [ -d /var/lib/mysql-back ]; then
	sudo cp -R /var/lib/mysql-back/* $MOUNT_PATH/mysql
else
	echo -e "${RED}[ERROR]${NC} Cannot find datadir backed"
	echo "    Usage: You must clone your original @datadir to /var/lib/mysql-back/"
	echo "    Usage: For example, run below command if you're using default datadir"
	echo "        cp -R /var/lib/mysql /var/lib/mysql-back"
	exit 1
fi
sudo chown -R mysql:mysql $MOUNT_PATH/mysql

echo "[SETUP] Link /var/lib/mysql -> $MOUNT_PATH/mysql"
if [ -d /var/lib/mysql ]; then
	sudo rm -rf /var/lib/mysql
else
	sudo rm /var/lib/mysql
fi
sudo ln -s $MOUNT_PATH/mysql /var/lib/mysql
sudo chown -R mysql:mysql /var/lib/mysql

echo "[SETUP] Launching MySQL daemon..."
sudo service mysql start & sleep 5
sudo mysql --user=$USER --password=$PASSWORD < ../mysql/create.sql
