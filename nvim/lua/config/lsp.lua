local vim = vim

vim.g.lsp_enabled = true

vim.keymap.set("n", "<leader>lt", function()
	vim.g.lsp_enabled = not vim.g.lsp_enabled

	if not vim.g.lsp_enabled then
		for _, client in pairs(vim.lsp.get_clients()) do
			client:stop(true)
		end
	end

	print("LSP " .. (vim.g.lsp_enabled and "enabled" or "disabled"))
end)

local lsp_configs = {}

for _, file in ipairs(vim.api.nvim_get_runtime_file("lsp/*.lua", true)) do
	table.insert(lsp_configs, dofile(file))
end

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

	if client:supports_method("textDocument/documentColor") and vim.lsp.document_color then
		vim.lsp.document_color.enable(true, { bufnr = bufnr })
		lsp_key("grc", vim.lsp.document_color.color_presentation)
	end
end

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	callback = function()
		if not vim.g.lsp_enabled then
			return
		end

		local max_filesize = 200 * 1024
		local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(0))
		if ok and stats and stats.size > max_filesize then
			return
		end

		local capabilities = require("blink.cmp").get_lsp_capabilities(nil, true)
		local ft = vim.bo.filetype

		for _, config in ipairs(lsp_configs) do
			if config.filetypes and vim.tbl_contains(config.filetypes, ft) then
				if not config.root_dir then
					config.root_dir = vim.loop.cwd()
				end

				local client_id = vim.lsp.start(vim.tbl_extend("force", config, {
					capabilities = capabilities,
				}))

				if client_id then
					vim.lsp.buf_attach_client(0, client_id)
				end
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
		return {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "if_many",
			header = "",
			prefix = "",
			max_width = 80,
			wrap = true,
		}
	end,
})
