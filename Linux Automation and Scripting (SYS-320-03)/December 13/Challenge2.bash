#! /bin/bash
echo "Log File:"
read logFile

echo "IOC File:"
read IOCFile

cat "$logFile" | grep -f "$IOCFile" | cut -d ' ' -f 1,4,7 > report.txt

