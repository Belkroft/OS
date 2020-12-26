#!/bin/bash

while true; do
	read str

	if [[ "$str" == "TERM" ]]; then
		kill -SIGTERM $(cat .pid)
		exit
	fi

	if [[ "$str" == "+" ]]; then
		kill -USR1 $(cat .pid)
		continue
	fi

	if [["$str" == "*" ]]; then
		kill -USR2 $(cat .pid)
		continue
	fi
done
