#!/usr/bin/bash

file="/var/log/apache2/access.log"

index=$(cat "$file" | grep -o 'GET /index.html' | tr -d "GET /" | wc -l)
favicon=$(cat "$file" | grep -o '/favicon.ico' | tr -d "/" | wc -l)
rootdir=$(cat "$file" | grep -o '/' | wc -l)
icon=$(cat "$file" | grep -o '/icons/ubuntu-logo.png' | wc -l)
page1=$(cat "$file" | grep -o 'GET /page1.html' | tr -d "GET /" | wc -l)
page2=$(cat "$file" | grep -o 'GET /page2.html' | tr -d "GET /" | wc -l)

echo "$rootdir", "/"
echo "$icon", "/icons/ubuntu-logo.png"
echo "$favicon", "favicon.ico"
echo "$index", "index.html"
echo "$page1", "page1.html"
echo "$page2", "page2.html"
