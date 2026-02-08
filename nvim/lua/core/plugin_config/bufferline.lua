-- Plugin: bufferline.nvim

-- Setup
local ok, bufferline = pcall(require, "bufferline")
if not ok then
	return
end

bufferline.setup({
	options = {
		-- Replace the default per-buffer close icon with a custom glyph.
		buffer_close_icon = "",
		-- Replace the default modified indicator with a custom glyph.
		modified_icon = "●",
		-- Replace the default global close icon with a custom glyph.
		close_icon = "",
	},
})
