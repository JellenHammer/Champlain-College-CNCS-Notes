#!/usr/bin/bash

hosts=servers.txt
ports=53
echo "host, port"
for host in $(cat $hosts); do
	for port in $ports; do
		timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null && echo "$host, $port"
	done
done
