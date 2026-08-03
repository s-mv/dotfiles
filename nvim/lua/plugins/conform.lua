return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters = {
				pandoc_md = {
					command = "pandoc",
					args = {
						"-f",
						"gfm+yaml_metadata_block",
						"-t",
						"gfm+yaml_metadata_block",
						"--standalone",
						"--wrap=none",
					},
					stdin = true,
				},
			},
			formatters_by_ft = {
				python = { "black" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				rust = { "rustfmt" },
				lua = { "stylua" },
				ocaml = { "ocamlformat" },
				markdown = { "prettier" },
			},
		})
	end,
}
