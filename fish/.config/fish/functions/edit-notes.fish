function edit-notes
	cd ~/Documents/notes
	nvim (fd . | fzf --prompt 'Select a file> ')
end
