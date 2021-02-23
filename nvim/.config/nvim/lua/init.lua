require 'plugins'
require 'plugin_config'
require 'options'
require 'settings'

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')
vim.cmd('colorscheme dracula')

require 'lsp'
require 'binds'
require 'statusline'
