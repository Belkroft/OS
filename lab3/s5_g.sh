#!/bin/bash

mkfifo fifo

while true; do

	read str
	echo "$str"

	if [[ ($str == [[::digit::]]*) || ("$str" == "+") || ("$str" == "*") ]]; then
		echo "$str" > fifo
	elif [[ "$str" == "QUIT" ]]; then
		echo "$str" > fifo
		#exit 0
	else
		echo "ERROR" > fifo
		echo "Entry error"
		#exit 1
	fi
done
