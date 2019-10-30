#!/bin/bash

NO_FORMAT="\033[0m"
C_BLUE="\033[38;5;12m"
C_GREEN="\033[38;5;2m"

path="$(dirname $0)"

packageCommand="yarn"
packageName="Yarn"

command=$*

# check if nano is example
which $packageCommand > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
	echo "$packageName isn't installed!"
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
	echo -en "Saving $packageName config [${C_BLUE}¤${NO_FORMAT}]"
	cp ~/.yarnrc $path/yarnrc
	echo -e "\rSaving $packageName config [${C_GREEN}+${NO_FORMAT}]"
}

###
# save config
###
function load {
	echo -en "Loading $packageName config [${C_BLUE}¤${NO_FORMAT}]"
	cp $path/yarnrc ~/.yarnrc
	echo -e "\rLoading $packageName config [${C_GREEN}+${NO_FORMAT}]"
}

function install {
	$path/../function.sh install $packageCommand
}

if [ -z $command ];then
	read -p "save, load or install? " e
	$e
else
	$command
fi
