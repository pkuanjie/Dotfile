-- Plugin: nvim-lastplace

-- Setup
local ok, lastplace = pcall(require, "nvim-lastplace")
if not ok then
	return
end

lastplace.setup({
	-- Do not restore cursor position in quickfix, nofile, or help buffers.
	lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
	-- Do not restore cursor position in these filetypes.
	lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
	-- Reopen folds when jumping to the last cursor position.
	lastplace_open_folds = true,
})
