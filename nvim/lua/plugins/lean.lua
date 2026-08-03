return {
	{
		"Julian/lean.nvim",
		ft = { "lean" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("lean").setup({})

			local map = vim.keymap.set
			map("n", "<leader>lh", "<cmd>LeanHover<CR>", { desc = "Lean hover" })
			map("n", "<leader>lr", "<cmd>LeanRestartServer<CR>", { desc = "Restart Lean LSP" })
			map("n", "<leader>lg", "<cmd>LeanToggleGoals<CR>", { desc = "Toggle goals window" })
		end,
	},
}

