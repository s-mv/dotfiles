-- more or less yoinked from https://github.com/joeldotdias/dotfiles/blob/master/nvim/lua/lemons/lsp.lua

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  once = true,
  callback = function()
    local server_configs = vim.iter(vim.api.nvim_get_runtime_file("lua/lsp/*.lua", true))
      :map(function(file)
        return vim.fn.fnamemodify(file, ":t:r")
      end)
      :totable()
    vim.lsp.enable(server_configs)
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_keys", { clear = true }),
  desc = "LSP keymaps",
  callback = function(event)
    local function lsp_key(lhs, rhs, mode)
      vim.keymap.set(mode or "n", lhs, rhs, { buffer = event.buf })
    end

    lsp_key("K", vim.lsp.buf.hover)
    lsp_key("gd", vim.lsp.buf.definition)
    lsp_key("gi", vim.lsp.buf.implementation)
    lsp_key("<leader>ca", vim.lsp.buf.code_action)
    lsp_key("<leader>rn", vim.lsp.buf.rename)
    lsp_key("<leader>D", vim.lsp.buf.type_definition)
    lsp_key("<C-h>", vim.lsp.buf.signature_help, "i")
  end,
})

vim.diagnostic.config({
  virtual_text = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "if_many",
    header = "",
    prefix = "",
  }
})

-- manually start servers
vim.lsp._enable_servers = function(config_names)
  for _, name in ipairs(config_names) do
    local ok, config = pcall(require, "lsp." .. name)
    if ok then
      vim.lsp.start(config)
    else
      vim.notify("Failed to load LSP config: " .. name, vim.log.levels.ERROR)
    end
  end
end

