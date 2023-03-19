local indent_blankline_setup, indent_blankline = pcall(require, "indent_blankline")
if not indent_blankline_setup then
	return
end

local hl_list = {}
for i, color in pairs({ "#662121", "#767621", "#216631", "#325a5e", "#324b7b", "#562155" }) do
	local name = "IndentBlanklineIndent" .. i
	vim.api.nvim_set_hl(0, name, { fg = color })
	table.insert(hl_list, name)
end
indent_blankline.setup({
	-- extra stuff
	char_highlight_list = hl_list,
	-- extra stuff
})
