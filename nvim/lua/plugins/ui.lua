return {
	-- Git signs
	{ "lewis6991/gitsigns.nvim", opts = {} },
	
	-- Color scheme
	{ 
		"catppuccin/nvim", 
		name = "catppuccin", 
		lazy = false,
		priority = 1000, 
		opts = { 
			flavour = "macchiato",
			integrations = {
				treesitter = true,
				telescope = true,
				gitsigns = true,
				lualine = true,
			},
		},
		config = function()
			vim.cmd.colorscheme("catppuccin-macchiato")
		end,
	},
}
