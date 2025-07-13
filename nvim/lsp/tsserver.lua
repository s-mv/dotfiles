return {
  name = "tsserver",
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
  root_dir = vim.fs.dirname(vim.fs.find({ "tsconfig.json", "package.json", ".git" }, { upward = true })[1]),
}

