-- Plugin: flash.nvim

-- Setup
local ok, flash = pcall(require, "flash")
if not ok then
	return
end

flash.setup()

--------------------------------------------------
-- Keymaps
--------------------------------------------------

-- Flash jump (two-char jump)
vim.keymap.set({ "n", "x", "o" }, "s", function()
	flash.jump()
end, { desc = "Flash" })

-- Flash Treesitter jump
vim.keymap.set({ "n", "x", "o" }, "S", function()
	flash.treesitter()
end, { desc = "Flash Treesitter" })

-- Remote Flash (operator mode only)
vim.keymap.set("o", "r", function()
	flash.remote()
end, { desc = "Remote Flash" })

-- Treesitter search
vim.keymap.set({ "o", "x" }, "R", function()
	flash.treesitter_search()
end, { desc = "Treesitter Search" })

--------------------------------------------------
-- Toggle Flash Search Mode
-- (controls / and ? enhanced search)
--------------------------------------------------
vim.keymap.set({ "c" }, "<C-s>", function()
	flash.toggle()
end, { desc = "Toggle Flash Search" })
