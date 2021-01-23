@echo off

driverquery /fo table /nh /v > driver.txt
sort /r driver.txt /o driver_sort.txt