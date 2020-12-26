#!/bin/bash

ps x > test.txt #commands
sed -i '/sbin*/! d' test.txt
cat test.txt | cut -c 4-7 > test.txt
nano test.txt #NO
rm test.txt #NO


