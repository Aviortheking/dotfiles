#!/bin/bash

C_WHITE="\033[38;5;15m"
NO_FORMAT="\033[0m"
C_BLUE="\033[38;5;12m"
C_GREEN="\033[38;5;2m"

path="$(dirname $0)/"

echo -e "\rLoading Oh My Fish addons [${C_BLUE}¤${NO_FORMAT}]"

###
# load addons
###
cat $path/list | while read line
do
	/usr/bin/fish -c "omf install ${line}"
done
/usr/bin/fish -c "omf theme"
read -p "Select the theme to use: " theme
/usr/bin/fish -c "omf theme $theme"
/usr/bin/fish -c "omf reload"

echo -e "\rLoading Oh My Fish addons [${C_GREEN}+${NO_FORMAT}]"
