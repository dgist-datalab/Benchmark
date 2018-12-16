#!/bin/bash

source global.sh

date
echo -e "${GREEN}[SYSBENCH] Running benchmark...${NC}"
sudo sysbench --test=oltp \
		--oltp-table-size=$TABLE_SIZE \
		--oltp-test-mode=nontrx \
		--oltp-nontrx-mode=$1 \
		--oltp-dist-type=uniform \
		--oltp-read-only=off \
		--num-threads=$NUM_THREADS \
		--max-time=$MAX_TIME \
		--max-requests=$MAX_REQUESTS \
		--db-driver=mysql \
		--mysql-db=dbtest \
		--mysql-table-engine=innodb \
		--mysql-user=$USER \
		--mysql-password=$PASSWORD \
		--mysql-socket=$SOCK_PATH \
		run
date
