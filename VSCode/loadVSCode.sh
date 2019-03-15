#!/bin/sh

C_WHITE="\033[38;5;15m"
NO_FORMAT="\033[0m"
C_BLUE="\033[38;5;12m"
C_GREEN="\033[38;5;2m"

path="$(dirname $0)/"

if [ $1 = "vscodium" ]; then
folder="VSCodium"
elif [ $1 = "code" ]; then
folder="Code"
else
folder=$1
fi

echo -en "\r${C_WHITE}Loading VSCode[${C_BLUE}¤${C_WHITE}]${NO_FORMAT}"

###
# Install extensions
###
cat $path/vscExtensions | while read line
do
$1 --install-extension $line
done

###
# Load settings
###
conf="~/.config/${folder}/User"

cp $path/settings.json ${conf}/settings.json
cp -r $path/snippets/ ${conf}/snippets/

echo -en "\r${C_WHITE}Loading VSCode[${C_GREEN}+${C_WHITE}]${NO_FORMAT}"
