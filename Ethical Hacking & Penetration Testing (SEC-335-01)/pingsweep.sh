#!/usr/bin/bash
{
for i in {2..50}; do
ping -c1 10.0.5.$i | grep "64 bytes from" | cut -d " " -f 4 | tr -d ":"&
done
}> sweep.txt
