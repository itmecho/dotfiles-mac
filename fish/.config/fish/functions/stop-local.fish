function stop-local
	osascript -e 'quit app "Docker"'
	kdev supervisor ctl stop all
	kdev supervisor stop
	kdev db ctl stop --force
	ps aux | rg bigtable | rg -v rg | awk '{print $2}' | xargs kill -9
end
