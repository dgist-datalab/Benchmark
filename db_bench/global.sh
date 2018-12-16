#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m'

K=1024
M=$((1024*K))
G=$((1024*M))

MOUNT_PATH=/media/robusta
ROCKS_PATH=/home/yoda/rocksdb

DB_DIR=$MOUNT_PATH/db
WAL_DIR=$MOUNT_PATH/wal

NUM_KEYS=$((4*M))
KEY_SIZE=32
VALUE_SIZE=8160
BLOCK_SIZE=8192
#BLOCK_SIZE=1048576
CACHE_SIZE=$((1*G))

NUM_THREADS=4
WRITES=$((NUM_KEYS/NUM_THREADS))
READS=$((NUM_KEYS/NUM_THREADS))


const_params="
  --db=$DB_DIR \
  --wal_dir=$WAL_DIR \
  \
  --num=$NUM_KEYS \
  --num_levels=7 \
  --key_size=$KEY_SIZE \
  --value_size=$VALUE_SIZE \
  --block_size=$BLOCK_SIZE \
  --cache_size=$CACHE_SIZE \
  --cache_numshardbits=6 \
  --compression_max_dict_bytes=0 \
  --compression_ratio=1.0 \
  --compression_type=none \
  --level_compaction_dynamic_level_bytes=true \
  --bytes_per_sync=$((8 * M)) \
  --cache_index_and_filter_blocks=0 \
  --pin_l0_filter_and_index_blocks_in_cache=1 \
  \
  --benchmark_write_rate_limit=0 \
  --hard_rate_limit=3 \
  --rate_limit_delay_max_milliseconds=1000000 \
  --write_buffer_size=$((256 * M)) \
  --target_file_size_base=$((256 * M)) \
  --max_bytes_for_level_base=$((4 * G)) \
  \
  --verify_checksum=1 \
  --delete_obsolete_files_period_micros=$((60 * M)) \
  --max_bytes_for_level_multiplier=8 \
  \
  --statistics=0 \
  --stats_per_interval=1 \
  --stats_interval_seconds=1 \
  --histogram=1 \
  \
  --memtablerep=skip_list \
  --bloom_bits=10 \
  --open_files=-1 \
  --use_direct_io_for_flush_and_compaction=1 \
  --use_direct_reads=1 \
  --disable_wal=0 \
  \
  --seed=1525545382 \
  \
  --max_background_compactions=16 \
  --max_write_buffer_number=8 \
  --max_background_flushes=7 \
  \
  --level0_file_num_compaction_trigger=4 \
  --level0_slowdown_writes_trigger=12 \
  --level0_stop_writes_trigger=20 "

