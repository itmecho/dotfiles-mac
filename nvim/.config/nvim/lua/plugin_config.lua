require('nvim-treesitter.configs').setup({
	highlight = {
		enable = true;
	}
})

require('nvim-web-devicons').setup({
	default = true;
})

require('telescope').setup({
	color_devicons = true;
	shorten_path = true;
})

require('telescope').load_extension('fzy_native')
