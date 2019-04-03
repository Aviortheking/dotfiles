#!/bin/bash

C_WHITE="\033[38;5;15m"
NO_FORMAT="\033[0m"
C_BLUE="\033[38;5;12m"
C_GREEN="\033[38;5;2m"

path="$(dirname $0)"

echo -en "\rSaving fish functions [${C_BLUE}¤${NO_FORMAT}]"

###
# save config
###
if [ ! -d "${path}/functions" ]; then
mkdir "${path}/functions"
fi
cp ~/.config/fish/functions/* $path/functions

echo -en "\rSaving fish functions [${C_GREEN}+${NO_FORMAT}]\n"
