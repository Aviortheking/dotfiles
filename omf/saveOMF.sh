#!/bin/bash

C_WHITE="\033[38;5;15m"
NO_FORMAT="\033[0m"
C_BLUE="\033[38;5;12m"
C_GREEN="\033[38;5;2m"

path="$(dirname $0)"

echo -en "\rSaving Oh My Fish addons [${C_BLUE}¤${NO_FORMAT}]"

###
# save config
###
/usr/bin/fish -c "omf list | tr '\t' '\n' | grep '^[a-z-]'> ${path}/list"

echo -en "\rSaving Oh My Fish addons [${C_GREEN}+${NO_FORMAT}]\n"
