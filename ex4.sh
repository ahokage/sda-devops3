#!/bin/bash

PATHS=$@

if [ $1 ]
then	
	for PATH in $PATHS
   	do
		if [ -f "$PATH" ]
		then
			echo "$PATH points to a file"
		elif [ -d "$PATH" ]
		then
			echo "$PATH points to a directory"
			ls -l $PATH
		else
			echo "$PATH points to something else"
		fi
	done
else
	echo "Invalid argument"
fi
