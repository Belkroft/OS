#!/bin/bash

./s4_c1.sh &
./s4_c2.sh &
./s4_c3.sh &

renice +10 $(cat pid_c1) &
kill $(cat pid_c3)
