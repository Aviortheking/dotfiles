#!/bin/bash

# getPackageManager() {

# }
###
#	Arch linux
###

###
#	[0] command
#	[1] install command
#	[2] search command
###
arch[0]="yay"
arch[1]="yay -S"
arch[2]="yay -Si"

arch[3]="pacman"
arch[4]="pacman -S"
arch[5]="pacman -Si"

debian[0]="apt"
debian[1]="apt install"
debian[2]="apt show"

debian[3]="apt-get"
debian[4]="apt-get install"
debian[5]="apt-get changelog"

function install {
	# echo $1
	os=$(getOs)
	which $1 > /dev/null 2>&1 && echo "Package already installed" && return 1
	if [ $os = "arch" ]; then
		search $1 > /dev/null 2>&1
		if [ ! $? -eq 0 ]; then
			echo "Package not found!"
			return 1
		fi
	fi
	pm=$(getPackageManager install)
	${pm} $1
}

function search {
	os=$(getOs)
	pm=$(getPackageManager search)
	# s=${$()}
	${pm} $1
}

###
#	return: OS name
##
function getOs {
	if [ -f "/etc/arch-release" ]; then
		echo "arch"
	fi
	which apt-get > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "debian"
	fi
}
###
#	param: string ?= install|search
#	return: the command
###
function getPackageManager {
	os=$(getOs)
	plus=0
	if [ ! -z $1 ]; then
		if [ $1 = "install" ]; then
			plus=1
		elif [ $1 = "search" ]; then
			plus=2
		fi
	fi

	if [ $os = "arch" ]; then
		for index in ${!arch[*]}
		do
			which ${arch[$index]} > /dev/null && echo ${arch[$((index + $plus))]} && return
		done
	fi
	if [ $os = "debian" ]; then
		for index in ${!debian[*]}
		do
			which ${debian[$index]} > /dev/null && echo ${debian[$((index + $plus))]} && return
		done
	fi
}

$*
