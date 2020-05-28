#!/bin/bash

n1=$(($RANDOM%30))

if [ $n1 -ge 10 -a $n1 -le 20 ]; then
	echo "$n1 esta entre 10 y 20"
fi
