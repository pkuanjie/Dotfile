local setup, treesj = pcall(require, "treesj")
if not setup then
	return
end

treesj.setup()

-- For extending default preset with `recursive = true`, but this doesn't work with dot
vim.keymap.set("n", "gj", function()
	treesj.toggle({ split = { recursive = true } })
end)
