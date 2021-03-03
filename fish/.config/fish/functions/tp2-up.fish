function tp2-up
	echo -e "\e[01m==> Update dnsmasq config\e[00m"
	kdev dns update-local --mimictest iain
	echo -e "\e[01m==> Creating loopback alias\e[00m"
	sudo ifconfig lo0 alias 127.0.0.2 up
	echo -e "\e[01m==> Forwarding 443 to 3000\e[00m"
	echo "rdr pass proto tcp from any to any port 443 -> 127.0.0.2 port 3000" | sudo pfctl -Ef -
	echo -e "\e[01m==> Done\e[00m"
	echo "    Now make sure your first DNS server in Network is set to 127.0.0.1"
end
