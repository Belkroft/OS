tasklist > proc.txt
type proc.txt | findstr /i /v "cmd.exe" > file.txt
rm proc.txt