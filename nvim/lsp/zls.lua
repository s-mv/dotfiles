return {
	cmd = { "zls" },
	filetypes = { "zig" },
	root_dir = vim.fs.dirname(vim.fs.find({
		"build.zig",
		"zls.json",
		".git",
	}, { upward = true })[1]),
}
