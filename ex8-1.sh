#!/bin/bash

FILEPATH=$1
TOPRINT=$2
COUNTER=1
RGX_EXPR='^[0-9]+$'

if ! [ $FILEPATH ]
then
        echo "FILEPATH argument not provided"
        exit 0
fi

if ! [[ -f $FILEPATH ]]
then
        echo "${FILEPATH} is not a valid file"
        exit 0
fi

if ! [[ -r $FILEPATH ]]
then
        echo "You do not have a read permission on ${FILEPATH}"
        exit 0
fi

while read LINE
do
        if [ $TOPRINT ]
        then
                if ! [[ $TOPRINT =~ $RGX_EXPR ]]
                then
                        echo "TOPRINT argument is not a number"
                        break;
                fi

                printf -v TOPRINT_INT '%d\n' $TOPRINT

                if [[ $COUNTER > $TOPRINT_INT ]]
                then
                        break;
                else
                        echo "${COUNTER}: ${LINE}"
                fi
        else
                 echo "${COUNTER}: ${LINE}"
        fi

        ((COUNTER++))

done < $FILEPATH
