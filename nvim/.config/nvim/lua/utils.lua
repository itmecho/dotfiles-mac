local function remove_trailing_whitespace()
	local view = vim.fn.winsaveview()
	vim.cmd([[keeppatterns %s/\s\+$//e]])
	vim.fn.winrestview(view)
end

local M = {
	remove_trailing_whitespace = remove_trailing_whitespace;
}

return M
