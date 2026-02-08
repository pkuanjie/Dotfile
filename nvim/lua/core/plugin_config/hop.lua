-- Plugin: hop.nvim

-- Setup
local ok, hop = pcall(require, "hop")
if not ok then
	return
end

hop.setup()

-- Keymaps
-- Jump to a word using Hop with gw (custom keymap).
vim.keymap.set("n", "gw", "<cmd>HopWord<CR>", { noremap = true, silent = true })
-- Jump to a single character using Hop with gs (custom keymap).
vim.keymap.set("n", "gs", "<cmd>HopChar1<CR>", { noremap = true, silent = true })
