local setup, lsp_signature = pcall(require, "lsp_signature")
if not setup then
	return
end

lsp_signature.setup({
	hi_parameter = "Search",
	close_timeout = 200,
	hint_enable = false,
})

-- keymaps
vim.keymap.set({ "n" }, "<leader>ts", function()
	lsp_signature.toggle_float_win()
end, { silent = true, noremap = true, desc = "toggle signature" })

vim.keymap.set({ "n" }, "<Leader>hp", function()
	vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = "toggle signature" })
