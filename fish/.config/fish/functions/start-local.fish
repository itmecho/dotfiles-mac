function start-local
	open /Applications/Docker.app
	kdev supervisor start
	kdev supervisor ctl start all
	kdev db ctl start
	echo 'Waiting for kubernetes to start'
	while ! kubectl --context docker-desktop get nodes &>/dev/null;
		echo -n '.'
		sleep 5
	end
	echo
	kubectx docker-desktop
	kubens sparx
end
