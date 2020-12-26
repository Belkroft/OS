#!/bin/bash

for i in $(ps -a -o pid | tail -n +2); do
	vmsize = $(grep -E -h -i "vmsize" /proc/$i/status |
	grep -E -h -i "VMSIZE" |
	grep -o "[0-9]\+")

	if [[ -z $vmsize ]]; then
		vmsize=0
	else
		echo $i ":" $vmsize
	fi

done |
sort -k2 -V |
tail -n 1 > test6.txt

top -b -o +VIRT |
head -n 10 |
tail -n 1 >> test6.txt

nano test6.txt
rm test6.txt
