#!/bin/bash

C_WHITE="\033[38;5;15m"
NO_FORMAT="\033[0m"
C_BLUE="\033[38;5;12m"
C_GREEN="\033[38;5;2m"

path="$(dirname $0)"

default=$*

which fish > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
	echo "fish isn't installed"
	echo "Would you like to install it?"
	read -p "[y/N] " t
	if [ ! -z $t ] && [ $t = "y" ]; then
		default="install"
	fi
fi


functionsFolder="$HOME/.config/fish/functions"

function save {
	echo -en "\rSaving fish functions [${C_BLUE}¤${NO_FORMAT}]"

	###
	# save config
	###
	if [ -d $functionsFolder ]; then

		if [ ! -d "${path}/functions" ]; then
			mkdir -p "${path}/functions"
		fi
		cp $functionsFolder/* $path/functions
	fi
	echo -en "\rSaving fish functions [${C_GREEN}+${NO_FORMAT}]\n"
}

function load {
	echo -en "\rLoading fish functions [${C_BLUE}¤${NO_FORMAT}]"

	###
	# save config
	###
	if [ -d "$path/functions" ]; then
		if [ ! -d $functionsFolder ]; then
			mkdir -p $functionsFolder
		fi
		cp $path/functions/* $functionsFolder/
	fi

	echo -en "\rLoading fish functions [${C_GREEN}+${NO_FORMAT}]\n"
}

function install {
	$path/../function.sh install fish
}

if [ -z $default ];then
	read -p "save or load? " e
	$e
else
	$default
fi
