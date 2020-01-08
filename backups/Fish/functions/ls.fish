# Defined in - @ line 0
function ls --description 'alias ls exa -lgha --time-style long-iso --grid --long --binary --classify --git'
	exa -lgha --time-style long-iso --grid --long --binary --classify --git $argv;
end
