vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>")

vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { noremap = true, silent = true })

vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.keymap.set("n", "<C-f>", function()
	require("conform").format({
		async = false,
		lsp_fallback = true,
	})
	local lines = vim.api.nvim_buf_get_lines(0, -2, -1, false)
	if lines[1] ~= "" then
		vim.api.nvim_buf_set_lines(0, -1, -1, false, { "" })
	end
end, { desc = "[F]ormat buffer" })

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.cursorline = true

vim.cmd("filetype plugin indent on")
vim.cmd("set smartindent")

