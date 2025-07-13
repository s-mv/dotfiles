return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.svelte = {
      install_info = {
        url = "https://github.com/Himujjal/tree-sitter-svelte",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main",
      },
      filetype = "svelte",
    }

    opts.ensure_installed = vim.tbl_extend("force", opts.ensure_installed or {}, {
      "c",
      "cpp",
      "rust",
      "ocaml",
      "lua",
      "python",
      "svelte",
      "typescript",
      "javascript",
      "html",
      "css",
      "scss",
      "json",
      "markdown",
      "bash",
    })

    opts.highlight = { enable = true }
    opts.indent = { enable = true }
  end,
}

