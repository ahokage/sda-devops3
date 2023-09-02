#!/bin/bash

while true
do
	echo "(a) Display disk usage."
	echo "(b) Display system uptime."
	echo "(c) Display logged user."
	echo "(q) Quit."
	read -p "Choose an option: " OPTION

	case "$OPTION" in
		"a")
			echo $(df);;
		"b")
			echo $(uptime);;
		"c")
			echo $(who);;
		"q")
			echo "Goodbye!"
			exit 0;;	
		*)
			echo "Your input is wrong, try again."
	esac
	echo " "
done

