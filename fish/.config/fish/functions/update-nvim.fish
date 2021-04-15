function update-nvim
	cd ~/src/neovim
	git pull
	rm -Rf build
	make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local" CMAKE_BUILD_TYPE=RelWithDebInfo
	make install
	cd -
end
