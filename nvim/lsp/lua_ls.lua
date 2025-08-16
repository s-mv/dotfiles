return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc", "lazy-lock.json", "stylua.toml", ".stylua.toml", ".git" },
	settings = {
		Lua = {
			completion = { callSnippet = "Replace" },
			-- Using stylua for formatting.
			format = { enable = false },
			hint = {
				enable = true,
				arrayIndex = "Disable",
			},
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					"${3rd}/luv/library",
				},
			},
		},
	},
}
