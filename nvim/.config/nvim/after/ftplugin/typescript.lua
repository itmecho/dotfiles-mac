vim.bo.expandtab = true
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2

function TSLint()
    local view = vim.fn.winsaveview()
    vim.cmd("silent execute '!./node_modules/.bin/tslint --fix -c tslint.json ' . expand('%:p')")
    vim.fn.winrestview(view)
    vim.cmd("checktime")
end

require("itmecho.utils").set_autocommands(
    "itmecho_typescript",
    {
        {"BufWritePost", "*.ts,*.tsx", "call v:lua.TSLint()"}
    }
)
