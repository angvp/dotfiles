return {
  {
    "jackMort/ChatGPT.nvim",
    cmd = { "ChatGPT","ChatGPTActAs","ChatGPTEditWithInstructions","ChatGPTRun" },
    keys = {
      { "<leader>ac", ":ChatGPT<CR>", desc = "Abrir ChatGPT" },
      { "<leader>ae", ":ChatGPTEditWithInstructions<CR>", desc = "Editar con instrucciones" },
      { "<leader>ar", ":ChatGPTRun explain_code<CR>", desc = "Explicar código" },
    },
    dependencies = { "nvim-lua/plenary.nvim","nvim-telescope/telescope.nvim","MunifTanjim/nui.nvim" },
    opts = { api_key_cmd = "echo $OPENAI_API_KEY", openai_params = { model = "gpt-4o-mini" }, openai_edit_params = { model = "gpt-4o-mini" } },
  },
}
