#!/usr/bin/bash

echo '"Please enter a subnet in the format "192.168.1"'
read subnet
echo 'Please enter a DNS server.'
read dns

echo "DNS resolution for $subnet"
for i in $subnet.{1..255};
do
nslookup -timeout=2 $i $dns | grep "name"
done

