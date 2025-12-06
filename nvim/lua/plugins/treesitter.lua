return {}
--[[
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		ensure_installed = {
			"lua",
			"vim",
			"vimdoc",
			"markdown",
			"markdown_inline",
			"javascript",
			"typescript",
			"tsx",
			"json",
			"html",
			"css",
			"python",
			"bash",
			"c",
			"cpp",
			"ocaml",
			"rust",
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
]]

