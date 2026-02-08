-- Plugin: toggleterm.nvim

-- Setup
local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
	return
end

toggleterm.setup({
	-- Open ToggleTerm with <leader>;.
	open_mapping = [[<leader>;]],
	-- Disable insert-mode mappings for ToggleTerm.
	insert_mappings = false,
	-- Open terminals as floating windows.
	direction = "float",
	-- Start terminals in insert mode.
	start_in_insert = true,
})

-- Helpers
-- Define terminal-mode keymaps for terminal buffers.
function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	-- Exit terminal mode with Esc.
	vim.keymap.set("t", "<esc>", [[<C-\\><C-n>]], opts)
	-- Exit terminal mode with <leader>j.
	vim.keymap.set("t", "<leader>j", [[<C-\\><C-n>]], opts)
end

-- Autocmds
-- Apply terminal keymaps to all terminal buffers.
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
-- Create a dedicated LazyGit terminal (hidden by default).
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

-- Helpers
-- Toggle the LazyGit terminal visibility.
function _G._lazygit_toggle()
	lazygit:toggle()
end

-- Keymaps
-- Toggle LazyGit in a floating terminal.
vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
