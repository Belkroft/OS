#!/bin/bash

declare -a array
declare -a numbers=(1,2,3,4,5,6,7,8,9,10)
rm -f report.log
i=0

while true; do
	array+=(${numbers[@]})
	let i++
	if [[ $i == 100000 ]]; then
		echo "${#array[@]}" >> report.log
		i=0
	fi
done
