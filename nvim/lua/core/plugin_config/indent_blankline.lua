-- Plugin: indent-blankline.nvim (ibl)

-- Setup
local ok, ibl = pcall(require, "ibl")
if not ok then
	return
end

local hooks_ok, hooks = pcall(require, "ibl.hooks")
if not hooks_ok then
	return
end

local highlight = {
	"RainbowRed", -- Custom indent color group for level 1 (non-default group name).
	"RainbowYellow", -- Custom indent color group for level 2 (non-default group name).
	"RainbowBlue", -- Custom indent color group for level 3 (non-default group name).
	"RainbowOrange", -- Custom indent color group for level 4 (non-default group name).
	"RainbowGreen", -- Custom indent color group for level 5 (non-default group name).
	"RainbowViolet", -- Custom indent color group for level 6 (non-default group name).
	"RainbowCyan", -- Custom indent color group for level 7 (non-default group name).
}

-- Highlight setup
-- Define custom highlight groups for rainbow indent guides (non-default colors).
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	-- Custom color for the first indent level.
	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
	-- Custom color for the second indent level.
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
	-- Custom color for the third indent level.
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
	-- Custom color for the fourth indent level.
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
	-- Custom color for the fifth indent level.
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
	-- Custom color for the sixth indent level.
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
	-- Custom color for the seventh indent level.
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

ibl.setup({
	-- Use the custom rainbow highlight groups for indent guides (non-default behavior).
	indent = { highlight = highlight },
})
