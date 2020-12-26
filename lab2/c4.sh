#!/bin/bash

proc=$(ls /proc)

for i in $(echo "$proc" | grep -E '[0-9]+'); do
	if ! [ -f "/proc/$i/status' ]; then
		continue;
	else
		pid=$i
		ppid=$(grep "^PPid:" "/proc/$i/status" | awk '{print $2}')
		ser=$(grep "sum_exec_runtime" "/proc/$i/sched" | awk '{print $3}')
		ns=$(grep "nr_switches" "/proc/$i/sched" | awk '{print $3}')

		art=0
		if ["$ns" -ne 0 ]; then
			art=$(echo "$ser"/"$ns" | bc -1)
		fi

		echo "$pid:$ppid:$art"
	fi
done | sort -nk 3 | awk '{printf "%s : Parent_ProcessID=%s : %s\n", $1, $2, $3}' > test4.txt
