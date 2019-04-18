#!/bin/bash

NO_FORMAT="\033[0m"
C_BLUE="\033[38;5;12m"
C_GREEN="\033[38;5;2m"

path="$(dirname $0)"
nanorc="$HOME/.nanorc"

# TODO: check if nano is installed

###
# save config
###
function save {
	echo -en "\rSaving nano config [${C_BLUE}¤${NO_FORMAT}]"

	cp $nanorc $path/

	echo -en "\rSaving nano config [${C_GREEN}+${NO_FORMAT}]\n"
}

###
# save config
###
function load {
	echo -en "\rLoading nano config [${C_BLUE}¤${NO_FORMAT}]"

	cp $path/.nanorc $nanorc

	echo -en "\rLoading nano config [${C_GREEN}+${NO_FORMAT}]\n"
}

function install {
	$path/../function.sh install nano
}

if [ -z $* ];then
	read -p "save, load or install? " e
	$e
else
	$*
fi
