-- Plugin: lspsaga.nvim

-- Setup
local ok, saga = pcall(require, "lspsaga")
if not ok then
	return
end

saga.setup({
	-- Use Ctrl+f / Ctrl+b to scroll the Lspsaga preview window.
	scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
	definition = {
		-- Open definition with Enter from the preview window.
		edit = "<CR>",
	},
	ui = {
		-- Custom background color for the Lspsaga UI.
		colors = { normal_bg = "#022746" },
	},
})
