return {
	"Shatur/neovim-ayu",
	name = "ayu",
	priority = 1000,
	lazy = false,
	config = function()
		require("ayu").setup({
			mirage = false,
		})
		vim.cmd("colorscheme ayu")

		vim.api.nvim_set_hl(0, "LineNr", { fg = "#8f4f0f", bg = "NONE" })
		vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#8f00ff", bold = true })
	end,
}
