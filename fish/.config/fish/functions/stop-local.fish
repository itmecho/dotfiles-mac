function stop-local
	osascript -e 'quit app "Docker"'
	kdev supervisor ctl stop all
	kdev supervisor stop
	kdev db ctl stop --force
end
