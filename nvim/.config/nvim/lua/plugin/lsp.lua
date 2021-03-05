local nvim_lsp = require('lspconfig')

local on_attach = function(client)
    require'completion'.on_attach(client)
end

nvim_lsp.gopls.setup{
    on_attach = on_attach;
}

nvim_lsp.rust_analyzer.setup{on_attach = on_attach}

nvim_lsp.sumneko_lua.setup{
    cmd = {"/Users/iainearl/src/lua-language-server/bin/macOS/lua-language-server", "-E", "/Users/iainearl/src/lua-language-server/main.lua"};
    on_attach = on_attach;
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim', 'use' }
            }
        }
    }
}

nvim_lsp.tsserver.setup{
    on_attach = on_attach;
}
