return {
	name = "pyright",
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },

	root_dir = function(fname)
		local root = vim.fs.find(
			{ "pyproject.toml", "setup.py", ".git" },
			{ upward = true, stop = vim.loop.os_homedir(), path = fname }
		)[1]

		if root then
			return vim.fs.dirname(root)
		end

		return vim.fs.dirname(fname)
	end,
}

