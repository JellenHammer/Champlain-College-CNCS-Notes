#!/usr/bin/bash

file="/var/log/apache2/access.log"

results=$(cat "$file" | grep 'curl/' | cut -d ' ' -f 1,12)

echo "$results"
