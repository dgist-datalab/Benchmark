#!/bin/bash

source global.sh

echo -e "${GREEN}[DB_BENCH] Running sequential write...${NC}"
sudo $ROCKS_PATH/db_bench \
		 --benchmarks=fillseq \
		 --use_existing_db=0 \
		 $const_params \
#		 --threads=2 \
#		 --writes=2097152

