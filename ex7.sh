#!/bin/bash

paths_to_dir=$@

function file_counter() {

	for path_to_dir in $paths_to_dir
	do
		if [ -e "$path_to_dir" ]
		then	
			if [ -d "$path_to_dir" ]
			then
				local NO_OF_FILES=$(ls -l $path_to_dir | wc -l)
				echo -e "$path_to_dir : $NO_OF_FILES"
			else
				echo "$path_to_dir is not a directory"
			fi
		else
			echo "$path_to_dir does not exist"
		fi
	done
}

file_counter

