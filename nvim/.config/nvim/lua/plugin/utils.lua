function RemoveTrailingWhitespace()
    local view = vim.fn.winsaveview()
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(view)
end

function RunFormatCommand(cmd)
    local view = vim.fn.winsaveview()
    vim.cmd('silent execute "%!' .. cmd .. '"')
    if vim.v.shell_error ~= 0 then
        vim.cmd("undo")
    end
    vim.fn.winrestview(view)
end
