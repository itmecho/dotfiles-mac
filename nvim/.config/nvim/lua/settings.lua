vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')
vim.cmd('colorscheme dracula')

vim.g.mapleader = ' '

vim.g.ale_disable_lsp = 1
vim.g.ale_linters_explicit = 1
vim.g.ale_typescript_tslint_config_path = 'tslint.json'

vim.g.completion_matching_strategy_list = {
	'exact',
	'substring',
	'fuzzy',
}

vim.g.diagnostic_enable_underline = 1
vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_show_sign = 1

vim.g.netrw_banner = 0

-- vim.g.rooter_patterns = {
-- 	'=orca',
-- 	'=nvim',
-- 	'=reportgen',
-- 	'node_modules',
-- }
