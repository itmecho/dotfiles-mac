set rtp+=/usr/local/bin/fzf
set rtp+=/usr/local/bin/rg

" Lua
lua require('init')

" StatusLine
function! StatusLine()
	return luaeval("require('statusline').status()")
endfunction
set statusline=%!StatusLine()

" Plugin configuration
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

call sign_define("LspDiagnosticsErrorSign", {"text" : "!", "texthl" : "LspDiagnosticsError"})
call sign_define("LspDiagnosticsWarningSign", {"text" : "?", "texthl" : "LspDiagnosticsWarning"})
call sign_define("LspDiagnosticsInformationSign", {"text" : "I", "texthl" : "LspDiagnosticsInformation"})
call sign_define("LspDiagnosticsHintSign", {"text" : "H", "texthl" : "LspDiagnosticsHint"})

" Functions
function! RemoveTrailingWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

function! ProjectSearch(...)
    if a:0 == 1
        let query = a:1
    else
        call inputsave()
        let query = input('Search: ')
        call inputrestore()
    endif
    execute 'silent grep! ''' . query . ''''
    call feedkeys('<CR>')
    execute 'copen'
endfunction

autocmd BufWritePost plugins.lua PackerCompile
autocmd BufWritePre * call RemoveTrailingWhiteSpace()
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
autocmd User LspProgressUpdate redrawstatus!

" Abbreviations
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qa! qa!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev Qall qall
cnoreabbrev Ack Ack!

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
