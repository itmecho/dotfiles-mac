local nvim_lsp = require("lspconfig")

nvim_lsp.gopls.setup {}

nvim_lsp.rust_analyzer.setup {}

nvim_lsp.sumneko_lua.setup {
    cmd = {
        "/Users/iainearl/src/lua-language-server/bin/macOS/lua-language-server",
        "-E",
        "/Users/iainearl/src/lua-language-server/main.lua"
    },
    settings = {
        Lua = {
            diagnostics = {
                globals = {"vim", "use"}
            }
        }
    }
}

nvim_lsp.tsserver.setup {}
