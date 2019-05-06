#!/bin/bash

NO_FORMAT="\033[0m"
C_BLUE="\033[38;5;12m"
C_GREEN="\033[38;5;2m"

path="$(dirname $0)"

command=$*

###
# save config
###
function save {
	echo -en "Saving HyperJS config [${C_BLUE}¤${NO_FORMAT}]"

	cp ~/.hyper.js $path/

	echo -e "\rSaving HyperJS config [${C_GREEN}+${NO_FORMAT}]"
}

###
# save config
###
function load {
	echo -en "Loading HyperJS config [${C_BLUE}¤${NO_FORMAT}]"

	cp $path/.hyper.js ~/

	echo -e "\rLoading HyperJS config [${C_GREEN}+${NO_FORMAT}]"
}

function install {
	echo "no install available"
	exit 1
}

if [ -z $command ];then
	read -p "save or load? " e
	$e
else
	$command
fi
