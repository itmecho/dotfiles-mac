local function keymap(mode, lhs, rhs, extra_opts)
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

keymap("i", "<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
keymap("i", "<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true})

-- Project
keymap("n", "<leader>po", '<cmd>lua require("itmecho.telescope").cd_to_project()<CR>')
keymap("n", "<leader>pr", "<cmd>cd ~/src/CloudExperiments<CR>")
keymap("n", "<leader>pss", '<cmd>lua require("itmecho.telescope").search_string()<CR>')
keymap("n", "<leader>psi", "<cmd>Telescope live_grep<CR>")

-- Files
keymap("n", "<leader>fl", "<cmd>Telescope find_files<CR>")
keymap("n", "<C-p>", "<cmd>Telescope find_files<CR>")
keymap("n", "<leader>fv", "<cmd>Telescope find_files cwd=~/.config/nvim<CR>")

-- Quickfix
keymap("n", "<C-j>", "<cmd>cnext<CR>")
keymap("n", "<C-k>", "<cmd>cprev<CR>")

-- Buffers
keymap("n", "<leader>bn", "<cmd>bnext<CR>")
keymap("n", "<leader>bp", "<cmd>bprevious<CR>")
keymap("n", "<leader>bl", "<cmd>Telescope buffers<CR>")
keymap("n", "<leader>bc", "<cmd>bufdo bd<CR>")

-- Diagnostics
keymap("n", "<leader>dn", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
keymap("n", "<leader>dp", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
keymap("n", "<leader>dl", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")

-- Terminal Toggle
keymap("n", "<leader>tt", "<cmd>BufTermToggle<CR>")
keymap("n", "<leader>tn", "<cmd>BufTermToggle<CR><C-\\><C-n>")
keymap("t", "<leader>tt", "<cmd>BufTermToggle<CR>")
keymap("t", "<leader>tn", "<C-\\><C-n>")

-- LSP Bindings
keymap("n", "<leader>vd", "<cmd>lua vim.lsp.buf.definition()<CR>")
keymap("n", "<C-]>", "<cmd>lua vim.lsp.buf.definition()<CR>")
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
keymap("n", "<leader>vi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
keymap("n", "<leader>vs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
keymap("n", "<leader>vt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
keymap("n", "<leader>vr", "<cmd>lua vim.lsp.buf.references()<CR>")
keymap("n", "<leader>vs", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
keymap("n", "<leader>vS", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
keymap("n", "<leader>vD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
keymap("n", "<leader>vf", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>")
keymap("n", "<leader>va", "<cmd>lua vim.lsp.buf.code_action()<CR>")
keymap("n", "<leader>vR", "<cmd>lua vim.lsp.buf.rename()<CR>")
keymap("n", "<leader>vx", "<cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR><cmd>edit<CR>")

-- Git bindings
keymap("n", "<leader>gs", "<cmd>Gstatus<CR>")
keymap("n", "<leader>gl", "<cmd>G pull<CR>")
keymap("n", "<leader>gp", "<cmd>G push<CR>")
keymap("n", "<leader>gb", "<cmd>lua require('itmecho.telescope').git_branches()<CR>")

-- Disable arrow keys
local keys = {"<up>", "<down>", "<left>", "<right>"}
for _, key in ipairs(keys) do
    keymap("i", key, "<nop>")
    keymap("n", key, "<nop>")
end

-- Esc clears search highlights
keymap("n", "<esc>", "<cmd>noh<CR><esc>")

-- Toggle spellchecker
keymap("n", "<leader>S", "<cmd>set spell!<CR>")

-- Center search result
keymap("n", "n", "nzzzv")

-- Stay in visual select after indenting
keymap("v", ">", ">gv")
keymap("v", "<", "<gv")

-- Abbreviations
vim.cmd("cnoreabbrev W! w!")
vim.cmd("cnoreabbrev Q! q!")
vim.cmd("cnoreabbrev Qa! qa!")
vim.cmd("cnoreabbrev Qall! qall!")
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev Wa wa")
vim.cmd("cnoreabbrev wQ wq")
vim.cmd("cnoreabbrev WQ wq")
vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev Q q")
vim.cmd("cnoreabbrev Qa qa")
vim.cmd("cnoreabbrev Qall qall")
vim.cmd("cnoreabbrev Ack Ack!")
