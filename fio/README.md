## FIO Benchmark

### 1. Run bench
* Sequential Read / Write

	    fio seqread.fio
	    fio seqwrite.fio

* Random Read / Write

		cd split
		fio randread_sp.fio
	    fio randwrite_sp.fio


### Note that
* you can change experimental variables on ``global.fio`` or ``split/global_sp.fio`` file.
