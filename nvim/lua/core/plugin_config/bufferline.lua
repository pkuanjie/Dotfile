local setup, bufferline = pcall(require, "bufferline")
if not setup then
	return
end
bufferline.setup({
	options = {
		show_close_icon = false,
	},
})
