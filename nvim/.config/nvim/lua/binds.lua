local function nnoremap(lhs, rhs)
	vim.api.nvim_set_keymap('n', lhs, rhs, { noremap = true, silent = true })
end

vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true, noremap = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', { expr = true, noremap = true })
vim.api.nvim_set_keymap('i', '<C-P>', '<Esc><cmd>Telescope find_files<CR>', { noremap = true })

nnoremap('<C-p>', '<cmd>Telescope find_files<CR>')
nnoremap('<leader>;', '<cmd>Telescope buffers<CR>')

-- Diagnostics
nnoremap('<leader>dn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
nnoremap('<leader>dp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
nnoremap('<leader>dl', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')

-- Search Project
nnoremap('<leader>si', '<cmd>Telescope live_grep<CR>')
vim.api.nvim_set_keymap('v', '<leader>si', 'y:Telescope live_grep<CR><C-R>0', { noremap = true })

-- Search Tags
nnoremap('<leader>st', '<cmd>Telescope tags<CR>')

-- Terminal Toggle
nnoremap('<leader>tt', '<cmd>BufTermToggle<CR>')
nnoremap('<leader>tn', '<cmd>BufTermToggle<CR><C-\\><C-n>')
vim.api.nvim_set_keymap('t', '<leader>tt', '<cmd>BufTermToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('t', '<leader>tn', '<C-\\><C-n>', { noremap = true })

-- LSP Bindings
nnoremap('<leader>vd', '<cmd>lua vim.lsp.buf.definition()<CR>')
nnoremap('K',          '<cmd>lua vim.lsp.buf.hover()<CR>')
nnoremap('<leader>vi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
nnoremap('<leader>vs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
nnoremap('<leader>vt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
nnoremap('<leader>vr', '<cmd>lua vim.lsp.buf.references()<CR>')
nnoremap('<leader>vs', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
nnoremap('<leader>vS', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
nnoremap('<leader>vD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
nnoremap('<leader>vf', '<cmd>lua vim.lsp.buf.formatting_sync()<CR>')
nnoremap('<leader>va', '<cmd>lua vim.lsp.buf.code_action()<CR>')
nnoremap('<leader>vR', '<cmd>lua vim.lsp.buf.rename()<CR>')

-- Disable arrow keys
local keys = {'<up>', '<down>', '<left>', '<right>'}
for _, key in ipairs(keys) do
	vim.api.nvim_set_keymap('i', key, '<nop>', { silent = true, noremap = true })
	vim.api.nvim_set_keymap('n', key, '<nop>', { silent = true, noremap = true })
end

-- Esc clears search highlights
nnoremap('<esc>', '<cmd>noh<CR><esc>')
nnoremap('<leader>S', '<cmd>set spell!<CR>')
nnoremap('<leader>h', '<C-w>h')
nnoremap('<leader>l', '<C-w>l')
nnoremap('<leader>k', '<C-w>k')
nnoremap('<leader>j', '<C-w>j')

-- Center search result
nnoremap('n', 'nzzzv')

-- Stay in visual select after indenting
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })
