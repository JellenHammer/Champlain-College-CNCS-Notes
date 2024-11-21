#!/usr/bin/bash

link="10.0.17.6/IOC.html"

curl -sL "$link" | \
#xmlstarlet format --html --recover 2>/dev/null | \
xmlstarlet select --template --value-of "//table//tr//td" | \
awk 'NR % 2 == 1' > ioc.txt 
