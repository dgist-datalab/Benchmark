#!/bin/bash

source global.sh

echo -e "${GREEN}[DB_BENCH] Running Sequential Read...${NC}"
sudo $ROCKS_PATH/db_bench \
		 --benchmarks=readseq\
		 --use_existing_db=1 \
		 $const_params \
		 --threads=$NUM_THREADS \
		 --reads=$READS \

