vim.bo.textwidth = 120
vim.wo.colorcolumn = "120"
vim.bo.expandtab = false
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4

vim.cmd('command! -bang LuaFmt call v:lua.RunFormatCommand("luafmt --stdin")')

vim.cmd("autocmd BufWritePre *.lua LuaFmt")
