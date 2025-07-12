-- more or less yoinked from https://github.com/joeldotdias/dotfiles/blob/master/nvim/lua/lemons/lsp.lua

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
	once = true,
	callback = function()
		local server_configs = vim.iter(vim.api.nvim_get_runtime_file("lsp/*.lua", true))
			:map(function(file)
				return vim.fn.fnamemodify(file, ":t:r")
			end)
			:totable()
		vim.lsp.enable(server_configs)
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_keys", { clear = true }),
	desc = "LSP keymaps",
	callback = function(event)
		local lsp_key = function(keymap, func, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keymap, func, { buffer = event.buf })
		end

		local fzf = require("fzf-lua")

		lsp_key("K", function()
			vim.lsp.buf.hover({ border = "rounded" })
		end)
		lsp_key("gd", fzf.lsp_definitions)
		lsp_key("gi", fzf.lsp_implementations)
		lsp_key("<leader>D", fzf.lsp_typedefs)
		lsp_key("<leader>ds", fzf.lsp_document_symbols)
		lsp_key("<leader>ws", fzf.lsp_live_workspace_symbols)
		lsp_key("<leader>ca", function()
			fzf.lsp_code_actions({ silent = true })
		end)
		lsp_key("<leader>br", fzf.lsp_references)
		lsp_key("<leader>rn", vim.lsp.buf.rename)
		lsp_key("<C-h>", vim.lsp.buf.signature_help, "i")
	end,
})

vim.diagnostic.config({
	virtual_text = true,
	float = function()
		return {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "if_many",
			header = "",
			prefix = "",
		}
	end,
})
