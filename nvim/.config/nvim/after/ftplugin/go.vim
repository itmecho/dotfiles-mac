set textwidth=80
set colorcolumn=80
set noexpandtab
set ts=4
set shiftwidth=4
set softtabstop=4

autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)

nnoremap <buffer> <leader>cc :call RnrExec("go build")<CR>
nnoremap <buffer> <leader>ct :call RnrExec("go test ./...")<CR>
