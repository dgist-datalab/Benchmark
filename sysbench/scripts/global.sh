#!/bin/bash

K=1000
M=$((1000 * K))

MOUNT_PATH=/media/robusta

# 10M-> 2.3G
TABLE_SIZE=$((200 * M))
MAX_REQ=0
MAX_TIME=60
NUM_THREADS=16

USER=root
PASSWORD=191066
SOCK_PATH=/var/run/mysqld/mysqld.sock

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

