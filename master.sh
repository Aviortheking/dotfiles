#!/bin/bash

scripts=(
	"vscode"
	"omf"
	"nano"
	"hyperjs"
	"fish"
)

function save {
	# save
	for item in ${scripts[*]}
	do
		$item/$item.sh save
	done
}

function load {
	for item in ${scripts[*]}
	do
		$item/$item.sh load
	done
}



if [ -z $* ];then
	read -p "save or load? " e
	$e
else
	$*
fi
