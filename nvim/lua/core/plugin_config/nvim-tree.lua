-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
local setup, nvim_tree = pcall(require, "nvim-tree")
if not setup then
	return
end
nvim_tree.setup()

vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>")
vim.api.nvim_create_autocmd({ "QuitPre" }, {
	callback = function()
		vim.cmd("NvimTreeClose")
	end,
})
