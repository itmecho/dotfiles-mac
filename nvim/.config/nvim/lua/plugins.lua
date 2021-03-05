vim.cmd('packadd packer.nvim')

return require('packer').startup(function()
    -- Packer
    use { 'wbthomason/packer.nvim', opt = true }

    -- " LSP
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'nvim-lua/lsp_extensions.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use 'tjdevries/astronauta.nvim'
    -- use 'airblade/vim-rooter'
    use 'tpope/vim-commentary'
    use 'tpope/vim-fugitive'
    use 'kyazdani42/nvim-web-devicons'
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    use 'itmecho/bufterm.nvim'
    use 'chrisbra/Colorizer'

    -- " Language plugins
	use 'sheerun/vim-polyglot'

    -- Prettier
    use { 'prettier/vim-prettier', run = 'yarn install' }

    -- " Color Schemes
    use { 'dracula/vim', as = 'dracula' }
end)
