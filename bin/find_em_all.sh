#!/bin/bash

FILE=/tmp/breakdown
FILE_NO_MATCHES=/tmp/no_matches

if [ -f $FILE ] ; then
	rm $FILE
fi

if [ -f $FILE_NO_MATCHES ] ; then
	rm $FILE_NO_MATCHES
fi

while read line
do
	echo "$line" >> $FILE
	grep --exclude-dir=".git" -ro "$line" . | grep -v makos | grep -v SOURCES.txt >> $FILE
	
	count=`grep --exclude-dir=".git" -ro "$line" . | grep -v makos | grep -v SOURCES.txt | wc -l`
	if [[ $count -eq 0 ]] ; then 
		echo "$line" >> $FILE_NO_MATCHES
	fi

	echo "-----------------" >> $FILE
done < $1
