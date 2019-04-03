#!/bin/bash

###
#	WIP function
#	I need to remake all config before safely using it
###
echo "This is a WIP script please launch one by one the scripts you want ot backup/load"
exit 1

scripts=(
	"VSCode/vscode.sh"
	"omf/omf.sh"
	"nano/nano.sh"
	"hyperJS/hyperjs.sh"
	"fish/fish.sh"
)

function save {
	# save
	for item in ${scripts[*]}
	do
		$item save
	done
}

function load {
	#check if installed if not ask
	#load config
}



if [ -z $* ];then
	read -p "save or load? " e
	$e
else
	$*
fi
