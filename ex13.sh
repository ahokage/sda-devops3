#!/bin/bash

DOW="Mon Tue Wed Thu Fri Sat Sun"
COUNTER=1
CURRENT_DAY=$(date +%u)
SIGN=""

for day in $DOW
do
	if (( $COUNTER==$CURRENT_DAY ))
	then
		SIGN="*"
	else
		SIGN=""
	fi
	echo "Weekday ${COUNTER}: ${day} ${SIGN}"
	((COUNTER++))
done	

