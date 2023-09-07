#!/bin/bash
clear

USERNAME_USERFILE='username.file'
LOGS_FOLDER='logs'

echo "Application is uninstalling"
rm $USERNAME_USERFILE

rm -r $LOGS_FOLDER

sleep 2
echo "Application uninstalled!"


