#!/bin/bash
IFS=' /'
text=`ip a | grep 10.0.17.33`
read -a array <<< $text
echo "${array[1]}"

#text=$(cut -d " " -f 2 $text) > /dev/null
#echo $text[2]
