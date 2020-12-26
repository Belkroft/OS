#!/bin/bash

re() { #RECOVER FUNCTION
	path=$1
	file=$2
	ln $t/$file $path
}

IFS=$'\n'
name=$1 #GET FILE NAME

if [ $# != 1 ]; then
	echo "ARG QUAN ERROR"
	exit 1
fi

t=~/.trash
if [ ! -d $t ]; then
	echo "TRASH ERROR"
	exit 1
fi

tlog=~/.trash.log
if [ ! -f $tlog ]; then
	echo "TRASH.LOG ERROR"
	exit 1
fi

grep $name $tlog |
while read filepath; do
	file=$(echo $filepath | awk '{ if ($3=="") print $1; else print $1" "$2}')
	t_old=$(echo $filepath | awk '{ if ($3=="") print $2; else print $3" "$4}')

	echo "Confirm $t_old?"
	read ans < /dev/tty
	if [ $ans == "y" ]; then
		dir=$(dirname $file) &&

		if [ -d $dir ]; then
			$(re $file $t_old)
		else
			$(re $home/$name $t_old) &&
			echo "No folder. Recover in $home"
		fi &&

		rm $t/$t_old && {
			sed -i "#$filepath#d" $tlog
			echo "RECOVER"
		}
	elif [ $ans == "n" ]; then
		echo "Okeeeeeeey"
		exit 0
	else
		echo "ANSWER ERROR"
		exit 1
	fi
done
