return {
	-- Status line
	{ "nvim-lualine/lualine.nvim", opts = { options = { theme = "auto" } } },
	
	-- Icons
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	
	-- Symbols outline
	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		keys = { { "<leader>tt", "<cmd>SymbolsOutline<CR>", desc = "Symbols Outline" } },
		opts = {},
	},
	
	-- Window picker
	{ "s1n7ax/nvim-window-picker", version = "2.*", opts = {} },
	
	
	-- Trailspace cleaner
	{
		"nvim-mini/mini.trailspace",
		version = false,
		config = function()
			require("mini.trailspace").setup()
		end,
	},
	
	-- EditorConfig support
	{ "gpanders/editorconfig.nvim" },
	
	-- Split/Join code
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
	
	-- Git integration
	{ "tpope/vim-fugitive", cmd = { "G", "Git", "Gdiffsplit", "Gblame" } },
	
	-- Modern file explorer
	{
		"stevearc/oil.nvim",
		cmd = "Oil",
		keys = { { "-", "<cmd>Oil<CR>", desc = "Open parent directory" } },
		opts = {
			columns = { "icon" },
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-s>"] = "actions.select_vsplit",
				["<C-h>"] = "actions.select_split",
				["<C-t>"] = "actions.select_tab",
				["<C-p>"] = "actions.preview",
				["<C-c>"] = "actions.close",
				["<C-l>"] = "actions.refresh",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
				["g\\"] = "actions.toggle_trash",
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	
	-- ChatGPT integration
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			require("chatgpt").setup({
				api_key_cmd = "echo $OPENAI_API_KEY",
				openai_params = {
					model = "gpt-4",
					frequency_penalty = 0,
					presence_penalty = 0,
					max_tokens = 1000,
					temperature = 0,
					top_p = 1,
					n = 1,
					stream = true,
					stop = nil,
				},
				openai_edit_params = {
					model = "gpt-4",
					frequency_penalty = 0,
					presence_penalty = 0,
					temperature = 0,
					top_p = 1,
					n = 1,
				},
				use_openai_functions_for_edits = false,
				actions_paths = {},
				show_quickfixes_cmd = "Trouble quickfix",
				predefined_actions = {
					["fix"] = {
						prompt = "Fix the following code. Only return the fixed code without explanations:",
						prefix = "```\n",
						suffix = "\n```",
					},
					["explain"] = {
						prompt = "Explain how the following code works:",
						prefix = "```\n",
						suffix = "\n```",
					},
					["optimize"] = {
						prompt = "Optimize the following code:",
						prefix = "```\n",
						suffix = "\n```",
					},
					["docstring"] = {
						prompt = "Add a docstring to the following code:",
						prefix = "```\n",
						suffix = "\n```",
					},
					["tests"] = {
						prompt = "Create tests for the following code:",
						prefix = "```\n",
						suffix = "\n```",
					},
				},
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"folke/trouble.nvim",
		},
	},
	
	-- Treesitter
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
				"markdown",
				"bash",
				"dockerfile",
			},
		},
	},
}
