return {
	"mg979/vim-visual-multi",
	branch = "master",
	init = function()
		vim.g.VM_maps = {
			["Find Under"] = "<C-d>", -- like VSCode
			["Find Subword Under"] = "<C-d>",
		}
	end,
}
