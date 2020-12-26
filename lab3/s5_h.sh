#!/bin/bash

sym="+"
num=1

(tail -f line) |
while true; do
	read str
	if [[ "$str" == "ERROR" ]]; then
		rm -f line
		exit 1
	elif [[ "$str" == "QUIT" ]]; then
		rm -f line
		killall tail
		exit 0
	else
		if [[ "$str" == "+" || "$str" == "*" ]]; then
			sym="$str"
		fi

		if [[ "$str" == "+" ]]; then
			num=$(echo "$num $str" | awk '{print $1 + $2}')
			echo "$num"

		else
			num=$(echo "$num $str" | awk '{print $1 * $2}')
			echo "$num"
		fi
	fi
	fi
done
