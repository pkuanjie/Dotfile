-- Plugin: treesj

-- Setup
local ok, treesj = pcall(require, "treesj")
if not ok then
	return
end

treesj.setup()

-- Keymaps
-- Toggle split/join recursively with gj (custom keymap).
vim.keymap.set("n", "gj", function()
	treesj.toggle({ split = { recursive = true } })
end)
