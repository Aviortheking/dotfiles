#!/bin/bash

###
#	ostype[x] command
#	ostype[x+1] install command
#	ostype[x+2] search command
###

# Arch Linux
arch[0]="yay"
arch[1]="yay -S"
arch[2]="yay -Si"

arch[3]="pacman"
arch[4]="pacman -S"
arch[5]="pacman -Si"

# Debian bases (Debian, Ubuntu)
debian[0]="apt"
debian[1]="apt install"
debian[2]="apt show"

debian[3]="apt-get"
debian[4]="apt-get install"
debian[5]="apt-get changelog"

###
#	install the package
#	param: $1 the exact package name
#
#	return: echo: info on the package being already installed or not found
#	return: status_code: 1 is the was a problem
###
function install {
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

###
#	search for the package $1
#
#	param: $1 the exact package name
#	return: status_code: 0 the package exist, 1 the package don't exist
###
function search {
	pm=$(getPackageManager search)
	${pm} $1
}

###
#	return: echo: OS name
#	return: status_code: 0 OS found, 1 OS not found
##
function getOs {
	# Arch linux
	if [ -f "/etc/arch-release" ]; then
		echo "arch" && return
	fi

	# Debian based (check for apt-get (will be more accurate when I can install one))
	which apt-get > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "debian" && return
	fi
	return 1
}
###
#	Give the user the system package manager
#
#	param: $1 ?= install|search
#	if $0 is null return the package manager only
#
#	return: echo: the command
#	return: status_code: 0 is found, 1 is not found
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
		for index in ${!arch[*]}; do
			which ${arch[$index]} > /dev/null && echo ${arch[$((index + $plus))]} && return
		done
	fi
	if [ $os = "debian" ]; then
		for index in ${!debian[*]}; do
			which ${debian[$index]} > /dev/null && echo ${debian[$((index + $plus))]} && return
		done
	fi
	return 1
}

$*
