return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters = {
				prettier = {
					prepend_args = {
						"--print-width",
						"80",
						"--prose-wrap",
						"always",
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
