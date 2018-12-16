#!/bin/bash

source global.sh

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

