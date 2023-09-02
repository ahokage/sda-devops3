#!/bin/bash

#command here
cat /etc/passwd0

#if here
if [ "$?" -eq "0" ]
then
	echo "Command OK"
	exit 0
else
	echo "Command FAILED"
	exit 1
fi
