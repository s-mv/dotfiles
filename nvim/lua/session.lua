local session_file = vim.fn.expand("~/.local/share/nvim/session.vim")
vim.fn.mkdir(vim.fn.fnamemodify(session_file, ":h"), "p")

vim.opt.sessionoptions = {
	"buffers",
	"curdir",
	"folds",
	"help",
	"tabpages",
	"winsize",
	"globals",
}

local function save_session()
	vim.cmd("silent! mksession! " .. vim.fn.fnameescape(session_file))
end

local lsp_configs

local function get_lsp_configs()
	if lsp_configs then
		return lsp_configs
	end

	lsp_configs = {}

	for _, file in ipairs(vim.api.nvim_get_runtime_file("lsp/*.lua", true)) do
		local ok, cfg = pcall(dofile, file)
		if ok and type(cfg) == "table" then
			table.insert(lsp_configs, cfg)
		end
	end

	return lsp_configs
end

local function attach_lsp_to_buffer(bufnr)
	if not vim.api.nvim_buf_is_loaded(bufnr) then
		return
	end

	local ft = vim.bo[bufnr].filetype
	if not ft or ft == "" then
		return
	end

	local capabilities = require("blink.cmp").get_lsp_capabilities(nil, true)

	for _, config in ipairs(get_lsp_configs()) do
		if config.filetypes and vim.tbl_contains(config.filetypes, ft) then
			local client_id = vim.lsp.start(vim.tbl_extend("force", config, {
				root_dir = config.root_dir or vim.loop.cwd(),
				capabilities = capabilities,
			}))

			if client_id then
				vim.lsp.buf_attach_client(bufnr, client_id)
			end
		end
	end
end

local function load_session()
	if vim.fn.filereadable(session_file) ~= 1 then
		return
	end

	vim.cmd("silent! source " .. vim.fn.fnameescape(session_file))

	-- attach LSPs to restored buffers
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(bufnr) then
			attach_lsp_to_buffer(bufnr)
		end
	end
end

vim.api.nvim_create_autocmd("UIEnter", {
	once = true,
	callback = function()
		if vim.fn.argc() ~= 0 then
			return
		end

		if vim.fn.filereadable(session_file) == 1 then
			vim.schedule(function()
				load_session()

				vim.cmd("syntax enable")

				require("themes.smv")
			end)
		end
	end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = save_session,
})

