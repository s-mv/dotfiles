return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "c", "cpp", "rust", "ocaml", "lua", "python" },
    highlight = { enable = true },
    indent = { enable = true },
  },
}
