@echo off

systeminfo | findstr /B /C:"OS Version" > "OS.txt"
wmic os get FreePhysicalMemory > "Free Memory.txt"
wmic os get TotalVisibleMemorySize > "Used Memory.txt"
wmic logicaldisk list brief > "mem.txt"