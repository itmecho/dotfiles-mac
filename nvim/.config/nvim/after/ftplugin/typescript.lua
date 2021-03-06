function TSLint()
    local view = vim.fn.winsaveview()
    vim.cmd("execute '!./node_modules/.bin/tslint --fix -c tslint.json ' . expand('%:p')")
    vim.fn.winrestview(view)
end

vim.cmd("autocmd BufWritePost *.ts,*.tsx call v:lua.TSLint()")
