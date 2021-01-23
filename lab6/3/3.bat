@echo off

net stop Dnscache
timeout /t 10 /nobreak
net start > scan_2.txt
fc /a /t /c scan_1.txt scan_2.txt > diff.txt
net start Dnscache