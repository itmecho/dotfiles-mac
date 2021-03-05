vim.bo.textwidth = 120
vim.wo.colorcolumn = "120"
vim.bo.expandtab = false
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4

function RunFormatCommand(cmd)
	local view = vim.fn.winsaveview()
	vim.cmd('silent execute "%!' .. cmd .. '"')
	if vim.v.shell_error ~= 0 then
		vim.cmd('undo')
	end
	vim.fn.winrestview(view)
end

vim.cmd('command! -bang GoFmt call v:lua.RunFormatCommand("gofmt")')
vim.cmd('command! -bang GoImports call v:lua.RunFormatCommand("goimports")')
vim.cmd('command! -bang GoLines call v:lua.RunFormatCommand("golines -m 120 --base-formatter=gofmt")')

vim.cmd('autocmd BufWritePre *.go GoFmt')
