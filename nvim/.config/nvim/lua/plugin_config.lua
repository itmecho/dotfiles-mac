require('nvim-web-devicons').setup()

-- require('nvim-treesitter.configs').setup({
-- 	highlight = {
-- 		enable = true;
-- 	}
-- })

require('telescope').setup({
	color_devicons = true;
	shorten_path = true;
	mappings = {
		i = {
			["<C-q>"] = require('telescope.actions').send_to_qflist,
		}
	}
})

require('telescope').load_extension('fzy_native')

