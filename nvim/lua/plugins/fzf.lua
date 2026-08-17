return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	keys = function()
		local fzf = require("fzf-lua")
		return {
			{ "<C-b>", fzf.files },
			{ "<leader>g", fzf.git_files },
			{ "<C-p>", fzf.live_grep },
			{ "<leader>e", fzf.diagnostics_document },
			{ "<leader>r", fzf.lsp_references },
			{ "<leader>df", fzf.lsp_definitions },
		}
	end,
	opts = {
	git = {
	files = {
		cmd = "git ls-files --cached --others --exclude-standard",
	},
},		winopts = {
			preview = { scrollbar = false },
		},
		fzf_opts = {
			["--layout"] = "reverse-list",
		},
	},
	init = function()
		local fzf_ui = require("fzf-lua.providers.ui_select")
		vim.ui.select = fzf_ui.ui_select
	end,
}
