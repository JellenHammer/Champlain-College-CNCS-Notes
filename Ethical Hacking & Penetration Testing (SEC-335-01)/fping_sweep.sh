#!/usr/bin/bash

{
fping -a -q -g 10.0.5.2 10.0.5.50 | grep 10.0.0
}> sweep2.txt
