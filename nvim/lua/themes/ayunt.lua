local c = {
	fg = "#c0caf5", -- main foreground
	comment = "#565f89", -- subtle gray-blue
	keyword = "#9d7cd8", -- purple
	func = "#7aa2f7", -- bright blue
	string = "#9ece6a", -- green
	constant = "#bb9af7", -- lavender
	operator = "#89ddff", -- cyan-blue
	tag = "#7dcfff", -- sky blue
	special = "#e0af68", -- amber
	markup = "#f7768e", -- pink/red (used for markup or literals)
	error = "#f7768e", -- same as markup for emphasis
	accent = "#7aa2f7", -- accent for highlights
	entity = "#2ac3de", -- teal for types
	regexp = "#b4f9f8", -- mint cyan
}

local function hi(group, opts)
	if opts.bg == nil then
		opts.bg = "NONE"
	end
	vim.api.nvim_set_hl(0, group, opts)
end

-- Core
hi("Normal", { fg = c.fg })
hi("NormalNC", { fg = c.fg })
hi("CursorLineNr", { fg = c.accent, bold = true })
hi("Visual", { bg = "#2A2E45" })
hi("LineNr", { fg = "#3B4261" })
hi("CursorLine", { bg = "#23273E" })

-- Syntax
hi("Comment", { fg = c.comment, italic = true })
hi("Keyword", { fg = c.keyword, bold = true })
hi("Function", { fg = c.func })
hi("String", { fg = c.string })
hi("Constant", { fg = c.constant })
hi("Type", { fg = c.type })
hi("Operator", { fg = c.operator })
hi("Error", { fg = c.error })
hi("Todo", { fg = c.special, bold = true })
hi("Identifier", { fg = c.fg })

-- UI
hi("VertSplit", { fg = "#2E3440" })
hi("StatusLine", { fg = c.fg })
hi("StatusLineNC", { fg = c.comment })
hi("Pmenu", { fg = c.fg, bg = "#1E2030" })
hi("PmenuSel", { fg = "#1E2030", bg = c.keyword, bold = true })
hi("NormalFloat", { bg = "#1E2030" })
hi("FloatBorder", { fg = c.comment })

-- Tabs
hi("TabLineFill", { bg = "NONE", fg = "#3B4261" })
hi("TabLine", { bg = "NONE", fg = "#565F89" })
hi("TabLineSel", { bg = "#2F334D", fg = c.keyword, bold = true })
hi("TabLineSeparator", { fg = "#3B4261" })

