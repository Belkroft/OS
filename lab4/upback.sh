#!/bin/bash

last_date=$(ls ~ | grep -e "^Backup-" |
	sort -n -r | head -1 | sed "s/^Backup-//"
)

last_script=~/Backup-$last_date
get=~/get_actual

if [ ! -z $last_date ]; then
	if [ ! -d $get ]; then
		mkdir $get
	fi

	for file in $(ls $last_script | grep -E -v "[0-9]{4}-[0-9]{2}-[0-9]{2}"); do
		cp $last_script/$file $get/$file
	done
fi
