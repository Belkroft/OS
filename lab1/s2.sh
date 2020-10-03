#! /bin/bash

read a
b=""

while [ $a != "q" ]
do
	b="$b $a"
	read a
done

echo $b

