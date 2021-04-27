vim.bo.textwidth = 120
vim.wo.colorcolumn = "120"
vim.bo.expandtab = false
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4

function RunFormatCommand(cmd)
    local view = vim.fn.winsaveview()
    vim.cmd('silent execute "%!' .. cmd .. '"')
    if vim.v.shell_error ~= 0 then vim.cmd("undo") end
    vim.fn.winrestview(view)
end

function GoImports()
    vim.cmd("silent execute '!goimports -w " .. vim.fn.expand("%:p") .. "'")
    vim.cmd("edit")
end

vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

vim.cmd(
    "command! -bang GoFmt lua require('itmecho.utils').run_format_command('gofmt')")
vim.cmd("command! -bang GoImports call v:lua.RunFormatCommand('goimports')")
vim.cmd(
    "command! -bang GoLines call v:lua.RunFormatCommand('golines -m 120 --base-formatter=gofmt')")

local utils = require("itmecho.utils")

utils.set_autocommands("itmecho_go", {{"BufWritePre", "*.go", "GoImports"}})

utils.keymap("n", "<leader>ct",
             "<cmd>lua require('itmecho.telescope').gotest()<cr>")
