return {
	name = "verible",
	cmd = { "verible-verilog-ls" },
	filetypes = { "verilog", "systemverilog" },
	root_dir = vim.fs.dirname(vim.fs.find({
		".git",
		"WORKSPACE",
		"Makefile",
	}, { upward = true })[1]),
}

