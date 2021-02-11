local nvim_lsp = require('lspconfig')

local on_attach = function(client)
    require'completion'.on_attach(client)
end

nvim_lsp.gopls.setup{on_attach = on_attach}

nvim_lsp.jsonls.setup{on_attach = on_attach}

nvim_lsp.pyls.setup{on_attach = on_attach}

nvim_lsp.rust_analyzer.setup{on_attach = on_attach}

nvim_lsp.sumneko_lua.setup{
    cmd = {"/home/iain/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/bin/Linux/lua-language-server", "-E", "/home/iain/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/main.lua"};
    on_attach = on_attach;
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

nvim_lsp.tsserver.setup{
    on_attach = on_attach;
}

-- nvim_lsp.yamlls.setup{on_attach = on_attach}
