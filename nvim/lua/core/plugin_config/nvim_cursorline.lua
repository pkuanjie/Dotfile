local setup, nvim_cursorline = pcall(require, "nvim-cursorline")
if not setup then
	return
end

nvim_cursorline.setup({
	cursorline = {
		enable = false,
		timeout = 1000,
		number = false,
	},
	cursorword = {
		enable = true,
		min_length = 3,
		hl = { underline = true, background = "NONE" },
	},
})
