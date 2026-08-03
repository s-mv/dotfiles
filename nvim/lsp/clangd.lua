local function find_compile_commands(root)
	if vim.uv.fs_stat(root .. "/compile_commands.json") then
		return root
	end

	if vim.uv.fs_stat(root .. "/build/compile_commands.json") then
		return root .. "/build"
	end

	return root
end

local root = vim.fs.root(0, {
	".git",
	".clangd",
	"compile_commands.json",
	"build",
})

root = root or vim.loop.cwd()

print(find_compile_commands(root))

return {
	cmd = {
		"clangd",
		"--clang-tidy",
		"--compile-commands-dir=" .. find_compile_commands(root),
		"--header-insertion=iwyu",
		"--completion-style=detailed",
		"--fallback-style=none",
		"--function-arg-placeholders=false",
	},
	filetypes = { "c", "cpp", "cc", "h", "hpp" },
	root_markers = {
		".clangd",
		".git",
		"compile_commands.json",
	},
}
