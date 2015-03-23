#!/bin/bash

while read line
do
	echo "$line"
	find . -name $line | xargs rm
done < $1
