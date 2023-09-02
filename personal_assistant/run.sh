#!/bin/bash


#functions

function display_menu() {
	
	declare -a menu_items=('Show me the date!' 'Some other menu')
	
	local COUNTER=1
	for ((i=0; i<${#menu_items[@]}; i++))
	do
		echo "($COUNTER) - ${menu_items[$i]}"
		((COUNTER++))
	done

	echo "($COUNTER) - Exit App"	
}

display_menu
