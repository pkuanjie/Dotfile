local setup, alternate_toggler = pcall(require, "alternate_toggler")
if not setup then
	return
end

alternate_toggler.setup({
	alternates = {
		["=="] = "!=",
	},
})

vim.keymap.set("n", "gs", "<cmd>lua alternate_toggler.toggleAlternate()<CR>")
