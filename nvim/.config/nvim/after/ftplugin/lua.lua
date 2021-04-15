vim.bo.textwidth = 120
vim.wo.colorcolumn = "120"
vim.bo.expandtab = false
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4

vim.cmd('command! -bang LuaFmt lua require("itmecho.utils").run_format_command("luafmt --stdin")')

require("itmecho.utils").set_autocommands(
    "itmecho_lua",
    {
        {"BufWritePre", "*.lua", "LuaFmt"}
    }
)
