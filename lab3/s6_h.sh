#!/bin/bash

echo $$ > .pid

num=1

term() {
	echo "TERM"
	exit
}

plus() {
	sym="+"
}

mult() {
	sym="*"
}

trap 'plus' USR1
trap 'mult' USR2
trap 'term' SIGTERM

while true; do
	case $sym in
	"+") let num=$num+2
		echo $num ;;
	"*") let num=$num*2
		echo $num ;;
	esac
	sleep 1
done
