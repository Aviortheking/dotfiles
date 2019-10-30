#!/bin/bash

NO_FORMAT="\033[0m"
C_BLUE="\033[38;5;12m"
C_GREEN="\033[38;5;2m"

path="$(dirname $0)"

possible=("vscodium" "code" "codium")
possibleFolder=("VSCodium" "Code" "VSCodium")
ossFolder="Code - OSS" # just in case it's used
vs=()
vsFolder=()
touse="null"
touseFolder="null"

for index in ${!possible[*]}; do
	which ${possible[$index]} > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		vs+=(${possible[$index]})
		vsFolder+=(${possibleFolder[$index]})
	fi
done

if [ ${#vs[*]} -gt 1 ]; then
	# more than one vscode installed
	echo "vscodes found: ${vs[*]}"
	read -p "Please select the version of VSCode to use [0-${#vs[@]}]: " tmp
	touse=${#vs[$tmp]}
	touseFolder=${#vsFolder[$tmp]}
elif [ ${#vs[*]} -eq 1 ]; then
	# one vscode installed | vscode && vscode OSS installed
	touse=${vs[0]}
	touseFolder=${vsFolder[0]}
elif [ ${#vs[*]} -eq 0 ]; then
	# no vscode installed
	echo "No VSCode found would you like to install one?"
	read -p "[y/N] " y
	if [ ! -z $y ] && [ $y = "y" ]; then
		read -p "which version(I personally use vscodium) : " v
		$path/../function.sh install $v
		exit 0
	fi
	echo "well we can't do anything :("
	exit 1
fi

###
#	Code OSS special case
#	both vscode & vscod oss use the `code` command
###
if [ $touse = "code" ]; then
	codemicrosoft=0
	if [ -d "~/.config/Code" ]; then
		# microsoft's vscode folder exist
		codemicrosoft=1
	else
		touseFolder=$ossFolder
	fi
	if [ -d "~/.config/Code - OSS" ]; then
		# vscode OSS folder exist
		if [ $codemicrosoft = 1 ]; then
			echo "It's seems you've used both VSCode"
			echo "from Microsoft & VSCode OSS"
			echo "please tell the one you are using "
			read -p "[(M)icrosoft/(o)ss] " t
			if [ t = "o" ]; then
				touseFolder=$ossFolder
			fi
		fi

	fi
fi

vscode=$touse
conf="$HOME/.config/${touseFolder}/User"
extensionsFile="extensions.txt"

###
# save config
###
function save {
	echo -en "Saving VSCode Extensions [${C_BLUE}¤${NO_FORMAT}]"

	$vscode --list-extensions > $path/$extensionsFile

	echo -e "\rSaving VSCode Extensions [${C_GREEN}+${NO_FORMAT}]"
	echo -en "Saving VSCode Settings [${C_BLUE}¤${NO_FORMAT}]"

	cp $conf/settings.json $path/settings.json
	cp $conf/keybindings.json $path/keybindings.json

	if [ -d "$conf/snippets/" ]; then

		if [ ! -d "$path/snippets" ];then
			mkdir "$path/snippets"
		fi

		cp $conf/snippets/*.json $path/snippets/
	fi

	echo -e "\rSaving VSCode Settings [${C_GREEN}+${NO_FORMAT}]"
}

###
# load config
###
function load {
	echo -e "Loading VSCode Extensions [${C_BLUE}¤${NO_FORMAT}]"

	cat $path/$extensionsFile | while read line
	do
		$vscode --install-extension $line
	done
	echo -e "Loading VSCode Extensions [${C_GREEN}+${NO_FORMAT}]"
	echo -en "Loading VSCode Settings [${C_BLUE}¤${NO_FORMAT}]"

	cp $path/settings.json $conf/settings.json
	cp $path/keybindings.json $conf/keybindings.json

	if [ -d "$path/snippets/" ]; then
		if [ ! -d "$conf/snippets/" ]; then
			mkdir -p "$path/snippets/"
		fi

		cp $path/snippets/* $conf/snippets/
	fi

	echo -e "\rLoading VSCode Settings [${C_GREEN}+${NO_FORMAT}]\n"
}

function install {
	echo "WIP"
	# $path/../function.sh install nano
}

if [ -z $* ];then
	read -p "save or load? " e
	$e
else
	$*
fi
