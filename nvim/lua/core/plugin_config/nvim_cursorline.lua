-- Plugin: nvim-cursorline

-- Setup
local ok, cursorline = pcall(require, "nvim-cursorline")
if not ok then
	return
end

cursorline.setup({
	cursorline = {
		-- Disable line highlight, but keep the internal cursorline timer.
		enable = false,
		-- Delay cursorline updates by 1 second.
		timeout = 1000,
		-- Do not highlight the line number for the cursorline.
		number = false,
	},
	cursorword = {
		-- Enable word highlight for the word under the cursor.
		enable = true,
		-- Only highlight words with length >= 3.
		min_length = 3,
		-- Use a custom background color for the cursor word highlight.
		hl = { underline = false, background = "#5f0000" },
	},
})
