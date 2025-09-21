local map = vim.keymap.set
local silent = { noremap = true, silent = true }

-- Helper to lazy-require telescope
local function tb(f)
  return function()
    local ok, builtin = pcall(require, "telescope.builtin")
    if ok then
      return builtin[f]()
    else
      vim.cmd("Telescope " .. f:gsub("_", " "))
    end
  end
end

-- Buffers
map("n", "<C-o>", ":bp!<CR>", silent)
map("n", "<C-p>", ":bn!<CR>", silent)
map("n", "<C-k>", ":bd!<CR>", silent)
map("n", "<C-e>", "ggVG", silent)

-- Telescope bindings (lazy-required)
map("n", "<leader><C-P>", tb("find_files"), { desc = "Find Files" })
map("n", "<leader>a",     tb("buffers"),    { desc = "Buffers" })
map("n", "<leader>;",     tb("current_buffer_fuzzy_find"), { desc="Buffer Lines" })
map("n", "<leader>.",     tb("live_grep"),  { desc = "Live Grep" })
map("n", "<leader>o",     tb("current_buffer_tags"), { desc = "Buf Tags" })
map("n", "<leader>O",     tb("tags"),       { desc = "CTags" })
map("n", "<leader>?",     tb("oldfiles"),   { desc = "History" })
map("n", "<leader>gl",    tb("git_commits"),{ desc = "Git Commits" })
map("n", "<leader>ga",    tb("git_bcommits"),{ desc = "Git Buf Commits" })

-- Reload config
map("n", "<leader><C-R>", ":source $MYVIMRC<CR>", { desc = "Reload init.lua" })

-- Window picker
map("n", "-", function()
  local ok, picker = pcall(require, "window-picker")
  if ok then
    local winid = picker.pick_window({ include_current_win = false })
    if winid then vim.api.nvim_set_current_win(winid) end
  else
    vim.notify("window-picker no está cargado", vim.log.levels.WARN)
  end
end, { desc = "Elegir ventana" })
