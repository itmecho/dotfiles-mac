vim.cmd('packadd packer.nvim')

return require('packer').startup(function()
    -- " LSP
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'nvim-lua/lsp_extensions.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    use 'vim-airline/vim-airline'
    use 'airblade/vim-rooter'
    use 'tpope/vim-commentary'
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    use 'itmecho/bufterm.nvim'

    -- " Language plugins
	use 'sheerun/vim-polyglot'

    -- Prettier
    use { 'prettier/vim-prettier', run = 'yarn install' }

    -- " Color Schemes
    use { 'dracula/vim', as = 'dracula' }
end)
