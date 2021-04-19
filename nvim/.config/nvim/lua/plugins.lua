vim.cmd("packadd packer.nvim")

return require("packer").startup(
    function()
        -- Packer
        use {"wbthomason/packer.nvim", opt = true}

        -- " LSP
        use "neovim/nvim-lspconfig"
        use "hrsh7th/nvim-compe"
        use "nvim-lua/lsp_extensions.nvim"
        use {
            "nvim-telescope/telescope.nvim",
            requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
        }
        use "nvim-telescope/telescope-fzy-native.nvim"
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
        use "glepnir/lspsaga.nvim"
        use "glepnir/dashboard-nvim"

        use "tjdevries/astronauta.nvim"
        use "tpope/vim-commentary"
        use "tpope/vim-fugitive"
        use "kyazdani42/nvim-web-devicons"
        use "itmecho/neoterm.nvim"

        -- Dart
        use "dart-lang/dart-vim-plugin"

        -- Prettier
        use {"prettier/vim-prettier", run = "yarn install"}

        -- " Color Schemes
        use {"dracula/vim", as = "dracula"}
    end
)
