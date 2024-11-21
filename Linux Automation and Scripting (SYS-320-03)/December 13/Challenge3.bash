#!/usr/bin/bash

echo 
awk 'BEGIN { print "<table border=2>" }
     { print "<tr><td>" $1 "</td><td>" $2 "</td><td>" $3 "</td></tr>" }
     END   { print "</table>" }' report.txt > report.html


