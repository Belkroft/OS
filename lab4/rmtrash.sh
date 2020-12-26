#!/bin/bash


IFS=$'\n'
name=$1
num=0 #NAMES

if [ $# != 1 ]; then
	echo "ARG QUAN ERROR" # ??
	exit 1
elif [ -d $name ]; then
	echo "FOLDER ERROR"
	exit 1
elif [ ! -e $name ]; then
	echo "FILE ERROR"
	exit 1
fi

t=~/.trash
if [ ! -d $t ]; then
	mkdir $t # IF NO TRASH
fi

tlog=~/.trash.log
if [ ! -f $tlog ]; then
	touch $tlog # IF NO TRASH.LOG
fi

tname=$name
while [ -f $t/$tname ]; do
	let "$num+=1" #NAMES
	tname=$name-$num
done

ln -P $name $t/$tname #LINK

rm $name && echo $(realpath $name) $tname >> $tlog #FILE PATH
