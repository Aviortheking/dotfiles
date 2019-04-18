#!/bin/bash

NO_FORMAT="\033[0m"
C_BLUE="\033[38;5;12m"
C_GREEN="\033[38;5;2m"

path="$(dirname $0)"

#check if Fish exist
which fish > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
	echo "Fish not found"
fi
#check if omf exist
fish -c 'omf' > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
	echo "OMF not found"
fi

packagesFile="packages.txt"

###
# save config
###
function save {
	echo -en "\rSaving Oh My Fish addons [${C_BLUE}¤${NO_FORMAT}]"

	fish -c "omf list | tr '\t' '\n' | grep '^[a-z-]'> ${path}/$packagesFile"

	echo -en "\rSaving Oh My Fish addons [${C_GREEN}+${NO_FORMAT}]\n"
}

###
# save config
###
function load {
	echo -e "Loading Oh My Fish addons [${C_BLUE}¤${NO_FORMAT}]"

	cat $path/$packagesFile | while read line
	do
		fish -c "omf install ${line}"
	done
	fish -c "omf theme"
	read -p "Select the theme to use: " theme
	fish -c "omf theme $theme"
	fish -c "omf reload" # if user is in fish

	echo -e "Loading Oh My Fish addons [${C_GREEN}+${NO_FORMAT}]"
}

function install {
	curl -L https://get.oh-my.fish | fish
}

if [ -z $* ];then
	read -p "save, load or install? " e
	$e
else
	$*
fi
