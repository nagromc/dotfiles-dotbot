function backup -d "Quickly backup a file"
	cp -bf --suffix=.bak.`date +%Y%m%d-%H%M%S` $argv $argv
end
