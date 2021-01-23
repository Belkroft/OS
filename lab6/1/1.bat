@echo off

systeminfo | findstr /B /C:"OS Version" > "OS.txt"

wmic logicaldisk list brief > "mem.txt"

wmic os get FreePhysicalMemory > "free_mem.txt"
wmic os get TotalVisibleMemorySize > "used_mem.txt"
