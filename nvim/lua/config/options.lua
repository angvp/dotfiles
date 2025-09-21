local opt = vim.opt
vim.g.mapleader = " "
vim.g.maplocalleader = " "

opt.encoding = "utf-8"
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.shortmess:append("aI")
opt.showmode = true
opt.showcmd = true
opt.modeline = true
opt.incsearch = true
opt.hlsearch = true
opt.textwidth = 79
opt.ruler = true
opt.splitbelow = true
opt.splitright = true
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.hidden = true
opt.title = true
opt.number = true
opt.relativenumber = false
opt.cursorline = true
opt.wrap = false
opt.history = 500
opt.autoindent = true
opt.smartindent = true
opt.shiftround = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.expandtab = true
opt.selection = "inclusive"
opt.foldenable = true
opt.foldmethod = "marker"
opt.foldlevel = 100
pcall(function()
  opt.fillchars:append({ stl = " ", stlnc = " " })
end)
opt.timeoutlen = 1000
opt.ttimeoutlen = 0
opt.termguicolors = true
