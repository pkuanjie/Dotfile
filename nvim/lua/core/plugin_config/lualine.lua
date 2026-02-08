-- Plugin: lualine.nvim

-- Setup
local ok, lualine = pcall(require, "lualine")
if not ok then
	return
end

lualine.setup({
	options = {
		-- Enable icon support in the statusline.
		icons_enabled = true,
		-- Use the active colorscheme for lualine theming.
		theme = "auto",
	},
	sections = {
		lualine_a = {
			{
				-- Show the filename with a relative path.
				"filename",
				path = 1,
			},
		},
		-- Show git branch, diff stats, and diagnostics in section B.
		lualine_b = { "branch", "diff", "diagnostics" },
		-- Clear section C (non-default section layout).
		lualine_c = {},
		-- Clear section X (non-default section layout).
		lualine_x = {},
		-- Show progress in section Y.
		lualine_y = { "progress" },
		-- Show cursor location in section Z.
		lualine_z = { "location" },
	},
})
