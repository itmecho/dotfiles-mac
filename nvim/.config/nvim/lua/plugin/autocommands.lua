function RemoveTrailingWhiteSpace()
    local view = vim.fn.winsaveview()
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(view)
end

require("itmecho.utils").set_autocommands(
    "itmecho_general",
    {
        {"BufWritePost", "plugins.lua", "PackerCompile"},
        {"BufWritePre", "*", "call v:lua.RemoveTrailingWhiteSpace()"},
        {"BufWritePre", "*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html", "PrettierAsync"},
        {"ColorScheme", "*", "lua require('nvim-web-devicons').setup()"},
        {"User", "LspProgressUpdate", "redrawstatus!"}
    }
)
