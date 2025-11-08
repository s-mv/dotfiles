return {
	name = "svelte",
	cmd = { "svelteserver", "--stdio" },
	filetypes = { "svelte" },
	root_dir = vim.fs.dirname(vim.fs.find({ "package.json", ".git" }, { upward = true })[1]),
	settings = {
		svelte = {
			plugin = {
				compilerOptions = {
					dev = true,
				},
			},
		},
	},
}

