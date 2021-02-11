set rtp+=/usr/local/bin/fzf
set rtp+=/usr/local/bin/rg

" Lua
lua require('init')

let mapleader = ' '

" Plugin configuration
let g:airline_theme = 'dracula'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#nvimlsp#enabled = 0

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

let g:diagnostic_enable_underline = 1
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_show_sign = 1

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8, 'border': 'sharp' } }
let $FZF_DEFAULT_OPTS='--reverse'

let g:netrw_banner = 0

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
    let g:fzf_tags_command = 'rg --files | ctags --links=no -R -L-'
    let $FZF_DEFAULT_COMMAND="/usr/local/bin/rg --files --hidden --glob '\!.git/**'"
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

autocmd BufWritePre * call RemoveTrailingWhiteSpace()
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

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

" Key bindings
" if exists('*complete_info')
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <C-P> <Esc><cmd>Files<CR>

" File Open
" nnoremap <C-p> <cmd>Files<CR>
" File Buffers
" nnoremap <leader>; <cmd>Buffers<CR>

" Diagnostics
" nnoremap <leader>dn :NextDiagnosticCycle<CR>
" nnoremap <leader>dp :PrevDiagnosticCycle<CR>

" Search Project
" nnoremap <leader>sp <cmd>call ProjectSearch()<CR>
" vnoremap <leader>sp y:call ProjectSearch('<C-R>"')<CR>

" Search Interactively
" nnoremap <leader>si <cmd>Rg<cr>
" vnoremap <leader>si y:Rg '<C-R>"'<CR>

" Search Tags
" nnoremap <leader>st <cmd>Tags<CR>

" Terminal Toggle
" nnoremap <silent> <leader>tt <cmd>BufTermToggle<CR>
" tnoremap <silent> <leader>tt <cmd>BufTermToggle<CR>

" LSP Bindings
" nnoremap <silent> <leader>vd <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> K          <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> <leader>vi <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <leader>vs <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> <leader>vt <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> <leader>vr <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> <leader>vs <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> <leader>vS <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" nnoremap <silent> <leader>vD <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> <leader>vf <cmd>lua vim.lsp.buf.formatting_sync()<CR>
" nnoremap <silent> <leader>va <cmd>lua vim.lsp.buf.code_action()<CR>
" nnoremap <silent> <leader>vR <cmd>lua vim.lsp.buf.rename()<CR>

" Hard Mode
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>

" Esc clears search highlights
" nnoremap <silent> <esc> <cmd>noh<CR><esc>
" nnoremap <leader>S <cmd>set spell!<CR>
" nnoremap <leader>h <C-w>h
" nnoremap <leader>l <C-w>l
" nnoremap <leader>k <C-w>k
" nnoremap <leader>j <C-w>j

" Center search result
" nnoremap n nzzzv

" vnoremap > >gv
" vnoremap < <gv
