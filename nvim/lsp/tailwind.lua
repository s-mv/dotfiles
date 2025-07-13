return {
  name = "tailwindcss",
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = { "svelte", "typescriptreact", "html", "scss", "css" },
  root_dir = vim.fs.dirname(vim.fs.find({ "tailwind.config.ts", "tailwind.config.js", ".git" }, { upward = true })[1]),
}

