local M = {}

-- TODO Move this to a more appropriate file and make it global
-- so we can call v:lua.RunFormatCommand()
M.run_format_command = function(cmd)
    local view = vim.fn.winsaveview()
    vim.cmd('silent execute "%!' .. cmd .. '"')
    if vim.v.shell_error ~= 0 then
        vim.cmd("undo")
    end
    vim.fn.winrestview(view)
end

M.set_autocommands = function(group_name, autocommands)
    vim.cmd("augroup " .. group_name)
    vim.cmd("autocmd!")
    for _, a in ipairs(autocommands) do
        vim.cmd("autocmd " .. table.concat(a, " "))
    end
    vim.cmd("augroup END")
end

M.keymap = function(mode, lhs, rhs, extra_opts)
    extra_opts = extra_opts or {}
    local opts = {
        noremap = true,
        silent = true
    }
    for k, v in pairs(extra_opts) do
        opts[k] = v
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

return M
