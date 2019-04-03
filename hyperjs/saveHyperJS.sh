#!/bin/bash

C_WHITE="\033[38;5;15m"
NO_FORMAT="\033[0m"
C_BLUE="\033[38;5;12m"
C_GREEN="\033[38;5;2m"

path="$(dirname $0)"

echo -en "\r${C_WHITE}Saving HyperJS config [${C_BLUE}¤${C_WHITE}]${NO_FORMAT}"

###
# save config
###
cp ~/.hyper.js $path/

echo -en "\r${C_WHITE}Saving HyperJS config [${C_GREEN}+${C_WHITE}]${NO_FORMAT}\n"
