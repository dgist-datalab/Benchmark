#!/bin/bash

source global.sh

echo -e "${GREEN}[DB_BENCH] Running Random Read...${NC}"
sudo $ROCKS_PATH/db_bench \
		 --benchmarks=readrandom \
		 --use_existing_db=0 \
		 $const_params \
		 --threads=$NUM_THREADS \
		 --reads=$READS \

