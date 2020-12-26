#!/bin/bash

PID=$(ps -Ao pid --no-header)

for pid in $PID; do
	if [[ -f "/proc/$pid/io" ]]; then
		read_bytes=$(grep "read_bytes" "/proc/$pid/io" | awk '{print $2}')
		echo "$pid $read_bytes" >> temp1.lst
	fi
done

sleep 60 # 1 min

while read line; do
	pid=$(echo "$line" | awk '{print $1}')

	read_bytes=$(echo "$line" | awk '{print $2}')

	if [[ -f "/proc/$pid/io" ]]; then
		new_read_bytes=$(grep "read_bytes" "/proc/$pid/io" | awk '{print $2}')
		echo "$pid" $(echo "$new_read_bytes" "$read_bytes" | awk '{print($1-$2)}')>>temp2.lst
	fi
done < temp1.lst

sort -nk 2 temp2.lst > test7.txt
rm temp1.lst
rm temp2.lst

#nano test7.txt
#rm test7.txt
