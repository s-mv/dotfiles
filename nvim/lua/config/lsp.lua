local vim = vim

local function on_attach(client, bufnr)
	local lsp_key = function(keymap, func, mode)
		vim.keymap.set(mode or "n", keymap, func, { buffer = bufnr })
	end

	local fzf = require("fzf-lua")

	lsp_key("K", function()
		vim.lsp.buf.hover({ border = "rounded" })
	end)
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

	if client:supports_method("textDocument/definition") then
		lsp_key("gd", fzf.lsp_definitions)
		lsp_key("gD", function()
			fzf.lsp_definitions({ jump1 = false })
		end)
	end

	if client:supports_method("textDocument/documentColor") then
		vim.lsp.document_color.enable(true, bufnr, { style = "virtual" })
		lsp_key("grc", vim.lsp.document_color.color_presentation)
	end
end

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	once = true,
	callback = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities(nil, true)
		local ft = vim.bo.filetype

		for _, file in ipairs(vim.api.nvim_get_runtime_file("lsp/*.lua", true)) do
			local config = dofile(file)

			if config.filetypes and vim.tbl_contains(config.filetypes, ft) then
				if not config.root_dir then
					config.root_dir = vim.loop.cwd()
				end

				local client_id = vim.lsp.start_client(vim.tbl_extend("force", config, {
					on_attach = on_attach,
					capabilities = capabilities,
				}))

				vim.lsp.buf_attach_client(0, client_id)
			end
		end
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_keys", { clear = true }),
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client then
			on_attach(client, event.buf)
		end
	end,
})

vim.diagnostic.config({
	virtual_text = true,
	float = function()
		return { focusable = false, style = "minimal", border = "rounded", source = "if_many", header = "", prefix = "" }
	end,
})

