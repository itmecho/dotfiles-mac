vim.g.mapleader = ' '

vim.g.airline_theme = 'dracula'
vim.g.airline_powerline_fonts = 1
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#nvimlsp#enabled'] = 0

vim.g.completion_matching_strategy_list = {
	'exact',
	'substring',
	'fuzzy',
}

vim.g.diagnostic_enable_underline = 1
vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_show_sign = 1

vim.g.netrw_banner = 0

vim.g.rooter_patterns = {
	'.git',
	'package.json',
	'go.mod',
}
