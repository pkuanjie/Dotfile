-- Plugin: nvim-tree.lua

-- Settings
-- Disable netrw to prevent conflicts with nvim-tree.
vim.g.loaded_netrw = 1
-- Disable netrwPlugin to prevent conflicts with nvim-tree.
vim.g.loaded_netrwPlugin = 1

-- Setup
local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
	return
end

nvim_tree.setup()

-- Keymaps
-- Toggle and focus the file tree on the current file (custom keymap).
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>")

-- Autocmds
-- Close nvim-tree automatically when quitting Neovim.
vim.api.nvim_create_autocmd({ "QuitPre" }, {
	callback = function()
		vim.cmd("NvimTreeClose")
	end,
})
