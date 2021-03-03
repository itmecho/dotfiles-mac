set textwidth=100
set colorcolumn=100
set noexpandtab
set ts=4
set shiftwidth=4
set softtabstop=4

function! GoLines()
	let l:view = winsaveview()
	silent execute '%!golines'
	if v:shell_error != 0
		undo
	endif
	call winrestview(l:view)
endfunction

function! GoFmt()
	let l:view = winsaveview()
	silent execute '%!gofmt'
	if v:shell_error != 0
		undo
	endif
	call winrestview(l:view)
endfunction

autocmd BufWritePre *.go call GoFmt()
autocmd BufWritePre *.go call GoFmt()
