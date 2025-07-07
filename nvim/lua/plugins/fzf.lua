return {
  "junegunn/fzf.vim",
  dependencies = { "junegunn/fzf" },
  config = function()
    vim.keymap.set("n", "<C-b>", ":Files<CR>", { desc = "FZF Files" })
  end
}

