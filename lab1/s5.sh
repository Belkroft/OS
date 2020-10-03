#! /bin/bash

grep '.... INFO' /var/log/anaconda/syslog > info.log

nano info.log
rm info.log
