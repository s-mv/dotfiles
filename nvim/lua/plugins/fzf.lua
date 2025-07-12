return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  keys = function ()
    local fzf = require("fzf-lua")
    return {
      { "<C-b>", fzf.files },
      -- { "<C-S-b>", fzf.buffers },
      { "<C-p>", fzf.live_grep },
      { "<leader>r", fzf.lsp_references },
      { "<leader>df", fzf.lsp_definitions },
    }
  end,
  opts = {
    winopts = {
      preview = { scrollbar = false },
    },
    fzf_opts = {
      ["--layout"] = "reverse-list",
    },
  },
  init = function()
    -- Make fzf-lua override vim.ui.select
    local fzf_ui = require("fzf-lua.providers.ui_select")
    vim.ui.select = fzf_ui.ui_select
  end,
}

