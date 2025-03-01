local setup, bufferline = pcall(require, "bufferline")
if not setup then
	return
end
bufferline.setup({
	options = {
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
	},
})
