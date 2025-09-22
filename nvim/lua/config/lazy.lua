return function()
	require("lazy").setup({
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		{ import = "lazyvim.plugins.extras.lang.typescript" },
		{ import = "lazyvim.plugins.extras.lang.json" },
		{ import = "lazyvim.plugins.extras.ui.mini-animate" },
		{ import = "plugins" },
	}, {
		defaults = { lazy = true, version = false },
		-- install = { colorscheme = { "solarized" } },
		checker = { enabled = true },
		performance = { rtp = { disabled_plugins = { "gzip", "tarPlugin", "tohtml", "tutor", "zipPlugin" } } },
	})
end
