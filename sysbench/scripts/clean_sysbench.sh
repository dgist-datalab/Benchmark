#!/bin/bash

source global.sh

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
