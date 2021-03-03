vim.bo.textwidth = 100
vim.wo.colorcolumn = "100"
vim.bo.expandtab = false
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4

function GoLines()
	local view = vim.fn.winsaveview()
	vim.cmd('silent execute "%!golines"')
	if vim.v.shell_error ~= 0 then
		vim.cmd('undo')
	end
	vim.fn.winrestview(view)
end

function GoFmt()
	local view = vim.fn.winsaveview()
	vim.cmd('silent execute "%!gofmt"')
	if vim.v.shell_error ~= 0 then
		vim.cmd('undo')
	end
	vim.fn.winrestview(view)
end

vim.cmd('autocmd BufWritePre *.go call v:lua.GoFmt()')
