#! /bin/bash

echo "First num:"
read a

echo "Second num:"
read b

echo "Third num:"
read c

echo "Answer:"
if [ $a -gt $b ]; then
	if [ $a -gt $c ]; then
		echo $a
	else
		echo $c
	fi
else
	if [ $b -gt $c ]; then
		echo $b
	else
		echo $c
	fi
fi
