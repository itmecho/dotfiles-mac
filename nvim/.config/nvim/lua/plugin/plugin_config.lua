require("nvim-treesitter.configs").setup(
    {
        highlight = {
            enable = true
        },
        indent = {
            enable = true
        }
    }
)

require("telescope").setup(
    {
        color_devicons = true,
        shorten_path = true,
        mappings = {
            i = {
                ["<C-q>"] = require("telescope.actions").send_to_qflist
            }
        }
    }
)

require("telescope").load_extension("fzy_native")

require("nvim-web-devicons").setup()

require("lspsaga").init_lsp_saga()

require("compe").setup(
    {
        enabled = true,
        autocomplete = true,
        debug = false,
        min_length = 1,
        preselect = "enable",
        throttle_time = 300,
        source_timeout = 200,
        incomplete_delay = 400,
        max_abbr_width = 100,
        max_kind_width = 100,
        max_menu_width = 100,
        documentation = true,
        source = {
            path = false,
            buffer = false,
            calc = false,
            vsnip = false,
            nvim_lsp = true,
            nvim_lua = false,
            spell = false,
            tags = false,
            snippets_nvim = false,
            treesitter = false
        }
    }
)

vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_header = {
    "::::    ::: :::::::::: ::::::::  :::     ::: ::::::::::: ::::    :::: ",
    ":+:+:   :+: :+:       :+:    :+: :+:     :+:     :+:     +:+:+: :+:+:+",
    ":+:+:+  +:+ +:+       +:+    +:+ +:+     +:+     +:+     +:+ +:+:+ +:+",
    "+#+ +:+ +#+ +#++:++#  +#+    +:+ +#+     +:+     +#+     +#+  +:+  +#+",
    "+#+  +#+#+# +#+       +#+    +#+  +#+   +#+      +#+     +#+       +#+",
    "#+#   #+#+# #+#       #+#    #+#   #+#+#+#       #+#     #+#       #+#",
    "###    #### ########## ########      ###     ########### ###       ###"
}
vim.g.dashboard_custom_section = {
    a = {description = {"  Open Project       "}, command = "lua require('itmecho.telescope').cd_to_project()"},
    b = {description = {"  Find File          "}, command = "Telescope find_files"},
    c = {description = {"  Recently Used Files"}, command = "Telescope oldfiles"},
    d = {description = {"  Neovim Config      "}, command = "Telescope find_files cwd=~/.config/nvim"}
}
