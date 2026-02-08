-- Plugin: lsp_signature.nvim

-- Setup
local ok, lsp_signature = pcall(require, "lsp_signature")
if not ok then
	return
end

lsp_signature.setup({
	-- Highlight the active parameter with the Search highlight group.
	hi_parameter = "Search",
	-- Close the signature pop-up 200ms after leaving insert mode.
	close_timeout = 200,
	-- Disable inline signature hints (only show pop-ups).
	hint_enable = false,
})

-- Keymaps
-- Toggle the floating signature window (custom keymap).
vim.keymap.set("n", "<leader>ts", function()
	lsp_signature.toggle_float_win()
end, { silent = true, noremap = true, desc = "toggle signature" })

-- Show signature help via built-in LSP (custom keymap).
vim.keymap.set("n", "<leader>hp", function()
	vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = "toggle signature" })
