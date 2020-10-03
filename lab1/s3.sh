#! /bin/bash

select TEXT in "First paragraph" "Second paragraph" "Third paragraph" "Fourth paragraph"
do
	echo
	echo $TEXT
	echo
	break
done
