-- File: lua/core/plugin_config/lsp_signature.lua
-- Plugin: lsp_signature.nvim
-- Goal: setup once + auto attach on LspAttach (no duplicate require/on_attach in lsp_config)

-- Setup
local ok, lsp_signature = pcall(require, "lsp_signature")
if not ok then
	return
end

-- Global setup (runs once at startup).
lsp_signature.setup({
	-- Highlight the active parameter with the Search highlight group.
	hi_parameter = "Search",
	-- Close the signature pop-up 200ms after leaving insert mode.
	close_timeout = 200,
	-- Disable inline signature hints (only show pop-ups).
	hint_enable = false,
})

-- Auto-attach signature help whenever any LSP attaches to a buffer.
-- This avoids calling lsp_signature.on_attach() from every server's on_attach.
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "Attach lsp_signature to LSP buffers",
	callback = function(args)
		-- args.buf is the buffer that just got an LSP client attached
		-- Passing {} here means "use global setup defaults".
		lsp_signature.on_attach({}, args.buf)
	end,
})

-- Keymaps (global)
-- Toggle the floating signature window (custom keymap).
vim.keymap.set("n", "<leader>ts", function()
	lsp_signature.toggle_float_win()
end, { silent = true, noremap = true, desc = "toggle signature" })

-- Show signature help via built-in LSP (custom keymap).
vim.keymap.set("n", "<leader>hp", function()
	vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = "signature help" })

