#!/bin/bash

ppid_0="0"
artsum="0"
count="0"
avg="0"

echo -e "$(<test4.txt)\n" |
sed "s/[^0-9.]\+/ /g" |
sed "s/^ //g" |
while read str; do
	pid=$(awk '{print $1}' <<< $str)
	ppid=$(awk '{print $2}' <<< $str)
	art=$(awk '{print $3}' <<< $str)

	if [[ $ppid == $ppid_0 ]]; then
		artsum=$(echo "$artsum+$art" |
		bc |
		awk '{printf "%f", $0}')

		count=$(($count+1))
	else
		avg=$(echo "scale=5; $artsum/$count" |
		bc |
		awk '{printf "%f", $0}')

		echo "Average_Children_Running_Time_of_ParentID="$ppid_0" is "$avg
		artsum=$art
		count=1
		ppid_0=$ppid
	fi

	if [[ ! -z $pid ]]; then
		echo "ProcessID="$pid" : Parent_ProcessID"$ppid" : Average_Running_Time="$art
	fi

done > test5.txt

nano test5.txt
rm test5.txt
