#!/bin/bash

ps u > test.txt # commands
sed -i '/^root/! d' test.txt # only user
cat test.txt | wc -l > text.txt | # how many
cat test.txt | cut -c 13-16,64,67,68- >> text.txt # only commands

nano text.txt #NO
rm text.txt #NO
rm test.txt




