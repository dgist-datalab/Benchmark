## Sysbench OLTP Benchmark

### 0. Run with ``sudo`` permission && Run on ``scripts`` directory
    sudo -s
	cd scripts

### 1. Set up MySQL
    ./setup_mysql.sh

### 2. Create table used for test
    ./create_sysbench.sh

### 3. Run bench
* Complex bench

		./run_complex.sh

* Non-transactional benchs

		./run_nontrx.sh [ bench-mode ]

### 4. Clean-up
    ./clean_sysbench.sh
    ./clean_mysql.sh

### Note that
* you can change experimental variables on ``global.sh`` file.
