function! TSLint()
	let l:view = winsaveview()
	execute '!./node_modules/.bin/tslint --fix -c tslint.json ' . expand('%:p')
	call winrestview(l:view)
endfunction
