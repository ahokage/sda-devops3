#!/bin/bash

LOGS_PATH='logs'
DAILY_FILE_NAME=$(date +%F).log
FULL_LOG_PATH=$LOGS_PATH/$DAILY_FILE_NAME

LOG_LINE=$1

#check if daily file exists
if ! [ -f $FULL_LOG_PATH ]
then
	touch $FULL_LOG_PATH
fi

echo "$(date +'%F %T') User Andi -> $LOG_LINE" >> $FULL_LOG_PATH

