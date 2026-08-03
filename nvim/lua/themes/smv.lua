-- theme's AI generated because I have no colour cues
-- Ayu Dark theme (Purple-coded variant)
local c = {
	-- Core palette
	bg = "#0F1419",
	fg = "#E6E1CF",
	fg_idle = "#3E4B59",

	comment = "#5C6773",
	markup = "#F07178",
	constant = "#bb9af7", -- lavender purple
	operator = "#89ddff", -- cyan-blue
	tag = "#7dcfff", -- sky-blue
	regexp = "#b4f9f8", -- mint-cyan
	string = "#c0ffea", -- pastel mint-green
	func = "#b4a0ff", -- pastel violet
	special = "#E6B673",
	keyword = "#af7fff", -- softened violet

	error = "#FF3333",
	accent = "#b4a0ff", -- light violet accent
	panel = "#14191F",
	guide = "#2D3640",
	line = "#151A1E",
	selection = "#253340",
}

local function hi(g, o)
	if o.bg == nil then
		o.bg = "NONE"
	end
	vim.api.nvim_set_hl(0, g, o)
end

-- CORE UI
hi("Normal", { fg = c.fg, bg = "NONE" })
hi("NormalNC", { fg = c.fg, bg = "NONE" })
hi("NormalFloat", { fg = c.fg, bg = c.selection })
hi("FloatBorder", { fg = c.guide, bg = "NONE" })

hi("ColorColumn", { bg = c.line })
hi("CursorColumn", { bg = c.line })
hi("CursorLine", { bold = true })
hi("CursorLineNr", { fg = c.accent, bg = c.line })
hi("LineNr", { fg = c.guide })

hi("Visual", { bg = c.selection })
hi("VertSplit", { fg = c.bg })
hi("SignColumn", { bg = c.panel })
hi("Folded", { fg = c.fg_idle, bg = c.panel })
hi("FoldColumn", { bg = c.panel })

-- SYNTAX
hi("Comment", { fg = c.comment, italic = true })
hi("Constant", { fg = c.constant })
hi("String", { fg = c.string })
hi("Character", { fg = c.string })
hi("Number", { fg = c.constant })
hi("Boolean", { fg = c.constant })
hi("Float", { fg = c.constant })

hi("Identifier", { fg = c.tag })
hi("Function", { fg = c.func })

hi("Statement", { fg = c.keyword })
hi("Conditional", { fg = c.keyword })
hi("Repeat", { fg = c.keyword })
hi("Label", { fg = c.keyword })
hi("Operator", { fg = c.operator })
hi("Keyword", { fg = c.keyword })
hi("Exception", { fg = c.keyword })

hi("PreProc", { fg = c.special })
hi("Include", { fg = c.special })
hi("Define", { fg = c.special })
hi("Macro", { fg = c.special })
hi("PreCondit", { fg = c.special })

hi("Type", { fg = c.tag })
hi("StorageClass", { fg = c.tag })
hi("Structure", { fg = c.special })
hi("Typedef", { fg = c.tag })

hi("Special", { fg = c.special })
hi("SpecialChar", { fg = c.special })
hi("Tag", { fg = c.special })
hi("Delimiter", { fg = c.special })
hi("SpecialComment", { fg = c.special })
hi("Debug", { fg = c.special })

hi("Underlined", { fg = c.tag, underline = true })
hi("Ignore", {})
hi("Error", { fg = c.fg, bg = c.error })
hi("Todo", { fg = c.markup, bold = true })

-- UI ELEMENTS
hi("Pmenu", { fg = c.fg, bg = c.selection })
hi("PmenuSel", { fg = c.fg, bg = c.selection, reverse = true })
hi("PmenuSbar", { bg = c.selection })
hi("PmenuThumb", { bg = c.guide })

hi("StatusLine", { fg = c.fg, bg = c.panel })
hi("StatusLineNC", { fg = c.fg_idle, bg = c.panel })
hi("TabLine", { fg = c.fg, bg = c.panel, reverse = true })
hi("TabLineFill", { fg = c.fg, bg = c.panel })
hi("TabLineSel", { fg = c.fg, bg = c.panel })

hi("Search", { fg = c.bg, bg = c.constant })
hi("IncSearch", { fg = c.bg, bg = c.constant })
hi("MatchParen", { fg = c.fg, underline = true })

hi("Directory", { fg = c.fg_idle })
hi("Title", { fg = c.keyword })
hi("Question", { fg = c.string })
hi("MoreMsg", { fg = c.string })
hi("ModeMsg", { fg = c.string })
hi("WarningMsg", { fg = c.error })
hi("ErrorMsg", { fg = c.fg, bg = c.error })

hi("NonText", { fg = c.guide })
hi("SpecialKey", { fg = c.selection })
hi("Whitespace", { fg = c.guide })

hi("SpellBad", { fg = c.error, underline = true })
hi("SpellCap", { fg = c.tag, underline = true })
hi("SpellLocal", { fg = c.keyword, underline = true })
hi("SpellRare", { fg = c.regexp, underline = true })

-- DIFF
hi("DiffAdd", { fg = c.string, bg = c.panel })
hi("DiffChange", { fg = c.tag, bg = c.panel })
hi("DiffDelete", { fg = c.markup, bg = c.panel })
hi("DiffText", { fg = c.fg, bg = c.panel })

hi("diffAdded", { fg = c.string })
hi("diffRemoved", { fg = c.constant })

-- GIT SIGNS
hi("GitSignsAdd", { fg = c.string })
hi("GitSignsChange", { fg = c.tag })
hi("GitSignsDelete", { fg = c.markup })
hi("GitSignsChangeDelete", { fg = c.func })

-- NERDTREE / FILE TREE
hi("NERDTreeOpenable", { fg = c.fg_idle })
hi("NERDTreeClosable", { fg = c.accent })
hi("NERDTreeUp", { fg = c.fg_idle })
hi("NERDTreeDir", { fg = c.func })
hi("NERDTreeFile", {})
hi("NERDTreeDirSlash", { fg = c.accent })

-- TELESCOPE / FZF
hi("TelescopeBorder", { fg = c.guide })
hi("TelescopePromptBorder", { fg = c.guide })
hi("TelescopeResultsBorder", { fg = c.guide })
hi("TelescopePreviewBorder", { fg = c.guide })
hi("TelescopeSelection", { fg = c.fg, bg = c.selection })
hi("TelescopeMatching", { fg = c.accent, bold = true })

-- TREESITTER
hi("@comment", { link = "Comment" })
hi("@keyword", { link = "Keyword" })
hi("@string", { link = "String" })
hi("@function", { link = "Function" })
hi("@variable", { fg = c.fg })
hi("@constant", { link = "Constant" })
hi("@type", { link = "Type" })
hi("@operator", { link = "Operator" })
hi("@punctuation", { fg = c.fg })
hi("@tag", { fg = c.tag })
hi("@attribute", { fg = c.special })

