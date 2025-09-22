return {
	-- {
	-- 	"ishan9299/nvim-solarized-lua",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.o.background = "dark"
	-- 		vim.cmd.colorscheme("solarized")
	-- 	end,
	-- },
	{ "nvim-lualine/lualine.nvim", opts = { options = { theme = "auto" } } },
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		keys = { { "<leader>tt", "<cmd>SymbolsOutline<CR>", desc = "Symbols Outline" } },
		opts = {},
	},
	{ "s1n7ax/nvim-window-picker", version = "2.*", opts = {} },
	{ "mattn/emmet-vim", ft = { "html", "css", "javascript", "typescript", "tsx", "jsx" } },
	{
		"nvim-mini/mini.trailspace",
		version = false,
		config = function()
			require("mini.trailspace").setup()
		end,
	},
	{ "gpanders/editorconfig.nvim" },
	{
		"Wansmer/treesj",
		keys = { {
			"gJ",
			function()
				require("treesj").toggle()
			end,
			desc = "Split/Join",
		} },
		opts = { use_default_keymaps = false },
	},
	{ "tpope/vim-fugitive", cmd = { "G", "Git", "Gdiffsplit", "Gblame" } },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"python",
				"javascript",
				"typescript",
				"tsx",
				"json",
				"lua",
				"vim",
				"yaml",
				"html",
				"css",
			},
		},
	},
}
