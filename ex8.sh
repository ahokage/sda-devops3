#!/bin/bash

FILEPATH=$1
COUNTER=1
TOPRINT='*'
REGEX_EXPR='^[0-9]+$'

#begin validations
if ! [[ $FILEPATH ]]
then
	echo "FILEPATH argument not provided"
	exit 1
fi

if ! [[ -f $FILEPATH ]]
then
	echo "${FILEPATH} is not a valid file"
	exit 1
fi

if ! [[ -r $FILEPATH ]]
then
	echo "You do not have a read permission on ${FILEPATH}"
	exit 1
fi
#end validations

#ask user input
read -p "Insert number of rows you want to read: " TOPRINT

#begin user input validation
if ! [[ $TOPRINT =~ $REGEX_EXPR ]]
then
	echo "Your input is not a valid number"
	exit 1
fi

printf -v TOPRINT_INT '%d\n' $TOPRINT

#begin logic
while read LINE
do
	if (( $TOPRINT_INT >= $COUNTER ))
	then
		echo "${COUNTER}: ${LINE}"
	fi
	((COUNTER++))
done < $FILEPATH
#end logic

