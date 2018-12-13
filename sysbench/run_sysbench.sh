#!/bin/bash

USER=root
PASSWORD=191066
SOCK_PATH=/var/run/mysqld/mysqld.sock

GREEN='\033[0;32m'
NC='\033[0m'

date

echo -e "${GREEN}[SYSBENCH] Preparing table...${NC}"
sudo sysbench --test=oltp \
		--oltp-table-size=50000000 \
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
		--oltp-table-size=500000000 \
		--oltp-read-only=off \
		--num-threads=16 \
		--max-time=0 \
		--max-requests=1000000 \
		--db-driver=mysql \
		--mysql-db=dbtest \
		--mysql-table-engine=innodb \
		--mysql-user=$USER \
		--mysql-password=$PASSWORD \
		--mysql-socket=$SOCK_PATH \
		  run

date

echo -e "${GREE}[SYSBENCH] Cleaning table...${NC}"
sudo sysbench --test=oltp \
		--db-driver=mysql \
		--mysql-db=dbtest \
		--mysql-table-engine=innodb \
		--mysql-user=$USER \
		--mysql-password=$PASSWORD \
		--mysql-socket=$SOCK_PATH \
	  cleanup

date
