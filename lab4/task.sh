#!/bin/bash

if [[ (-z "$1") || (-z "$2") ]]; then
	echo "ERROR ARG"
elif [[ "$1" == "check" ]]; then
	(find ~/OS/lab4/.as_git -type d 2> /dev/null > /dev/null) ||
	(mkdir ~/OS/lab4/.as_git)

	find ~/OS/lab4/.as_git/$2 -type f 2> /dev/null > /dev/null

	if [[ $? == "0" ]]; then
		echo "IF WORKS"
		mod=$(diff $2 ~/OS/lab4/.as_git/$2)

		if [[ -z $mod ]]; then
			echo "WRITE"
			echo $mod >> "$2"".log" #WRITE CHANGES
		fi
	else
		echo "COPY"
		cp $2 ~/OS/lab4/.as_git/$2
	fi

elif [[ "$1" == "recover" ]]; then
	(find ~/OS/lab4/.as_git -type d 2> /dev/null > /dev/null)

	if [[ $? == "1" ]]; then
		echo "ERROR"
		exit 1
	fi

	find ~/OS/lab4/.as_git/$2 -type f 2> /dev/null > /dev/null

	if [[ $? == "1" ]]; then
		echo "ERROR"
		exit 1
	else
		rm $2
		ln ~/OS/lab4/.as_git/$2 "$2"".lnk"
	fi
else
	echo "INCORRECT COMMAND"
fi
