local colors = {
	fg = "#BFBDB6",
	tag = "#39BAE6",
	func = "#FFB454",
	entity = "#59C2FF",
	string = "#AAD94C",
	regexp = "#95E6CB",
	markup = "#F07178",
	keyword = "#FF8F40",
	special = "#E6B673",
	comment = "#ACB6BF",
	constant = "#D2A6FF",
	operator = "#F29668",
	accent = "#E6B450",
	error = "#D95757",
}

local function hi(group, opts)
	if opts.bg == nil then
		opts.bg = "NONE"
	end
	vim.api.nvim_set_hl(0, group, opts)
end

hi("Normal", { fg = colors.fg })
hi("NormalNC", { fg = colors.fg })
hi("SignColumn", { fg = colors.comment })
hi("LineNr", { fg = "#6C7380" })
hi("CursorLineNr", { fg = colors.accent, bold = true })
hi("CursorLine", { bg = "NONE" })
hi("VertSplit", { fg = "NONE" })
hi("EndOfBuffer", { fg = "NONE" })
hi("Visual", { bg = "#475266" }) -- keep subtle selection tint

hi("Comment", { fg = colors.comment, italic = true })
hi("Keyword", { fg = colors.keyword })
hi("Function", { fg = colors.func })
hi("String", { fg = colors.string })
hi("Constant", { fg = colors.constant })
hi("Type", { fg = colors.entity })
hi("Operator", { fg = colors.operator })
hi("Error", { fg = colors.error })
hi("Todo", { fg = colors.special, bold = true })

hi("GitSignsAdd", { fg = "#7FD962" })
hi("GitSignsChange", { fg = "#73B8FF" })
hi("GitSignsDelete", { fg = "#F26D78" })

