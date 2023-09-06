#!/bin/bash

USERNAME_FILENAME="username.file"
MAIN_MENU_EXIT_CODE=0
SONG_MENU_EXIT_CODE=0
IS_NUMBER_EXPR='^[0-9]+$'
LYRICS_FOLDER_PATH='resources/lyrics'
WEATHER_SCRIPT_PATH='resources/weather/weather.sh'


#check if app installed
USERNAME=$(<$USERNAME_FILENAME)

if [ -z $USERNAME ]
then
	echo "The app is not installed. Exiting..."
	sleep 1.5
	exit 0
fi

#greet user
clear
echo "Greetings $USERNAME!"

#functions

function display_menu() {
	
	declare -a menu_items=('Show me the weather for next week!' 'Tell me a joke!' 'Show me the date!' 'Show me song lyrics!' 'Tell me what activity should I do Today?')
	
	local COUNTER=1
	for ((i=0; i<${#menu_items[@]}; i++))
	do
		echo "($COUNTER) - ${menu_items[$i]}"
		((COUNTER++))
	done

	((MAIN_MENU_EXIT_CODE=COUNTER))

	echo "($COUNTER) - Exit App"	
}

function display_song_list () {
	
	local SONGS=($(ls $LYRICS_FOLDER_PATH))
	local COUNTER=1
	
	echo "------------------------------------------"
	for ((i=0; i<${#SONGS[@]}; i++ ))
        do
		echo "($COUNTER) - ${SONGS[$i]}"
		((COUNTER++))
        done
	((SONG_MENU_EXIT_CODE=COUNTER))
	echo "($COUNTER) - Go back"
	echo "------------------------------------------"

}

function display_song_list_menu() {
	
	local SONG_FILES=($(ls $LYRICS_FOLDER_PATH))

	while true
	do
		display_song_list

		read -p "Choose a song to display its lyrics or choose 'Go back' to return to the main menu: " SONG_OPTION

		case "$SONG_OPTION" in
		"$SONG_MENU_EXIT_CODE")
			echo "Exiting Songs Menu"
			sleep 0.8
			break;;
		*)
			if [[ $SONG_OPTION =~ $IS_NUMBER_EXPR && $SONG_OPTION -gt 0 && $SONG_OPTION -le ${#SONG_FILES[@]} ]]
			then
				((SONG_OPTION--))
				echo ""				
				cat $LYRICS_FOLDER_PATH/${SONG_FILES[$SONG_OPTION]}
				echo ""
				read -n 1 -r -s -p "Press any key to display song selection menu..." key
				echo ""
			else
				echo "Please input a correct value!"
			fi
		esac
	done	
}

#App Logic here
while true
do
	echo ""
	echo "******************************"
	echo "How may I help you today?"
	echo "******************************"
	
	display_menu

	read -p "Choose an option: " OPTION
	echo "******************************"
	echo ""

	case "$OPTION" in
	"1")
		sleep 0.8	
		source $WEATHER_SCRIPT_PATH
		;;
	"2")
		echo "Joke"
		;;
	"3")
		sleep 0.8
		echo "Today's date is $(date)"
		;;
	"4")
		echo "Lyrics"
		display_song_list_menu
		;;
	"5")
		echo "Activity"
		;;
	"$MAIN_MENU_EXIT_CODE")
		echo "Exiting the app... Goodbye $USERNAME!"
		sleep 1
		exit 0;;
	*)
		sleep 0.8
		echo "Please input a correct value!"
	esac
done


display_menu
