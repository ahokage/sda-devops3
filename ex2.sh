#!/bin/bash

FILE="/etc/sda_passwords"
if [ -e "$FILE" ]
then
	echo "$FILE exists"
	if [ -w "$FILE" ]
	then
		echo "We can write to $FILE"
	else
		echo "We can't write to $FILE"
	fi
else
	echo "$FILE does not exist"
fi

