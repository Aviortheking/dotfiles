#!/bin/bash

C_WHITE="\033[38;5;15m"
NO_FORMAT="\033[0m"
C_BLUE="\033[38;5;12m"
C_GREEN="\033[38;5;2m"

path="$(dirname $0)"

if [ $1 = "vscodium" ]; then
folder="VSCodium"
elif [ $1 = "code" ]; then
folder="Code"
else
folder="Code"
fi

echo -en "\r${C_WHITE}Saving VSCode [${C_BLUE}¤${C_WHITE}]${NO_FORMAT}"

###
# save extnsions
###
rm $path/vscExtensions 2> /dev/null
$1 --list-extensions >> $path/vscExtensions


###
# copy settings
###

cp ~/.config/$folder/User/settings.json $path/

if [ ! -d "${path}/snippets" ];then
mkdir "${path}/snippets"
fi
cp ~/.config/$folder/User/snippets/* $path/snippets/

echo -en "\r${C_WHITE}Saving VSCode [${C_GREEN}+${C_WHITE}]${NO_FORMAT}\n"
