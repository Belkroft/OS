#!/bin/bash

if [ $# != 0 ]; then
	echo "ERROR NO ARGUMENTS"
	exit 1
fi

last_date=$(ls ~ | grep -E "^Backup-" |
	sort -n -r | head -1 | sed "s/Backup-//")

last_script=~/Backup-$last_date
date_now=$(date +"%F")
date_now_f=$(date -d "$date_now" +"%s")
last_date_f=$(date -d $last_date +"%s")
diff=$(echo "($date_now_f - $last_date_f) / (3600 * 24)" | bc)
rep=~/.backup-report

if [[ $diff < 7 ]] && [ ! -z $last_date ]; then
	mod=""

	for file in $(ls ~/source); do
		if [ -f $last_script/$file ]; then
			source_size=$(wc -c ~/source/$file | awk '{print $1}')
			backup_size=$(wc -c $last_script/$file | awk '{print $1}')
			diff_size=$(echo "$source_size - $backup_size" | bc)

			if [ $diff_size != 0 ]; then
				mv $last_script/$file $last_script/$file.$date_now
				cp ~/source/$file $last_script
				mod="$mod$file $file.$date_now"
			fi
		else
			cp ~/source/$file $last_script
			mod="$mod\nCopy $file "
		fi
	done

	mod=$(echo $mod | sed "s/^\n//")

	if [ ! -z $mod ]; then
		echo -e "Backup-$last_date change:\n$mod" >> $rep
	fi
else
	mkdir ~/Backup-$date_now

	for file in $(ls ~/source); do
		cp ~/source/$file ~/Backup-$date_now
	done

	file_list=$(ls ~/source)
	echo -e "Backup-$date_now new - \n$file_list" >> $rep
fi
