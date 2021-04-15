local nvim_lsp = require("lspconfig")

local function on_attach()
    vim.bo.omnifunc = "v:lua.lsp.omnifunc"
    -- require("completion").on_attach(
    --     {
    --         completion_timer_cycle = 200
    --     }
    -- )
end

nvim_lsp.gopls.setup {
    on_attach = on_attach
}

nvim_lsp.rust_analyzer.setup {
    on_attach = on_attach
}

nvim_lsp.sumneko_lua.setup {
    cmd = {
        "/Users/iainearl/src/lua-language-server/bin/macOS/lua-language-server",
        "-E",
        "/Users/iainearl/src/lua-language-server/main.lua"
    },
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = {"vim", "use"}
            }
        }
    }
}

nvim_lsp.tsserver.setup {
    on_attach = on_attach
}

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        update_in_insert = false
    }
)
