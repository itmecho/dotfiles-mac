function start-local
	open /Applications/Docker.app
	kdev supervisor start
	kdev supervisor ctl start all
	kdev db ctl start
end
