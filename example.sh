#!/bin/bash

NO_FORMAT="\033[0m"
C_BLUE="\033[38;5;12m"
C_GREEN="\033[38;5;2m"

path="$(dirname $0)"

command=$*

# check if nano is example
which example > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
	echo "Example isn't installed!"
	echo "do you want to install it ?"
	read -p "[y/N] " t
	if [ ! -z $t ] && [ $t = "y" ]; then
		command="install"
	fi
fi


###
# save config
###
function save {
	echo -en "Saving Example config [${C_BLUE}¤${NO_FORMAT}]"

	echo -e "\rSaving Example config [${C_GREEN}+${NO_FORMAT}]"
}

###
# save config
###
function load {
	echo -en "Loading Example config [${C_BLUE}¤${NO_FORMAT}]"

	echo -e "\rLoading Example config [${C_GREEN}+${NO_FORMAT}]"
}

function install {
	$path/../function.sh install example
}

if [ -z $command ];then
	read -p "save, load or install? " e
	$e
else
	$command
fi
