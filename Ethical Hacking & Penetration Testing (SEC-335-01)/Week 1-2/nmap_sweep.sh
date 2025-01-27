#!/usr/bin/bash

nmap -n -sn 10.0.5.2-50 -oG - | awk '/Up$/{print $2}' >> sweep3.txt
