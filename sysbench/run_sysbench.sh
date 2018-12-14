#!/bin/bash

# 10,000,000 -> 1.8G ~ 2G
TABLE_SIZE=100000000
NUM_REQ=200000

USER=root
PASSWORD=191066
SOCK_PATH=/var/run/mysqld/mysqld.sock

GREEN='\033[0;32m'
NC='\033[0m'

date

echo -e "${GREEN}[SYSBENCH] Preparing table...${NC}"
sudo sysbench --test=oltp \
		--oltp-table-size=$TABLE_SIZE \
		--db-driver=mysql \
		--mysql-db=dbtest \
		--mysql-table-engine=innodb \
		--mysql-user=$USER \
		--mysql-password=$PASSWORD \
		--mysql-socket=$SOCK_PATH \
		prepare 

date

echo -e "${GREEN}[SYSBENCH] Running benchmark...${NC}"
sudo sysbench --test=oltp \
		--oltp-table-size=$TABLE_SIZE \
		--oltp-test-mode=complex \
		--oltp-dist-type=uniform \
		--oltp-read-only=off \
		--num-threads=16 \
		--max-time=0 \
		--max-requests=$NUM_REQ \
		--db-driver=mysql \
		--mysql-db=dbtest \
		--mysql-table-engine=innodb \
		--mysql-user=$USER \
		--mysql-password=$PASSWORD \
		--mysql-socket=$SOCK_PATH \
		  run

date

echo -e "${GREEN}[SYSBENCH] Cleaning table...${NC}"
 sudo sysbench --test=oltp \
		--db-driver=mysql \
		--mysql-db=dbtest \
		--mysql-table-engine=innodb \
		--mysql-user=$USER \
		--mysql-password=$PASSWORD \
		--mysql-socket=$SOCK_PATH \
	  cleanup

date
