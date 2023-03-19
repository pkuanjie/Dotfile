local setup, hop = pcall(require, "hop")
if not setup then
	return
end

hop.setup()

-- keymaps
vim.api.nvim_set_keymap("n", "gw", "<cmd>HopWord<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gs", "<cmd>HopChar1<cr>", { noremap = true, silent = true })
