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

-- ChatGPT keybindings
map("n", "<leader>cc", ":ChatGPT<CR>", { desc = "ChatGPT Chat" })
map("n", "<leader>ce", ":ChatGPTEditWithInstruction<CR>", { desc = "ChatGPT Edit" })
map("n", "<leader>cx", ":ChatGPTRun explain_code<CR>", { desc = "ChatGPT Explain" })
map("n", "<leader>cf", ":ChatGPTRun fix<CR>", { desc = "ChatGPT Fix" })
map("n", "<leader>co", ":ChatGPTRun optimize<CR>", { desc = "ChatGPT Optimize" })
map("n", "<leader>cd", ":ChatGPTRun docstring<CR>", { desc = "ChatGPT Docstring" })
map("n", "<leader>ct", ":ChatGPTRun tests<CR>", { desc = "ChatGPT Tests" })

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
