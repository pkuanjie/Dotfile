-- Plugin: boole.nvim

-- Setup
local ok, boole = pcall(require, "boole")
if not ok then
	return
end

boole.setup({
	mappings = {
		-- Override the default increment mapping with <leader>a.
		increment = "<leader>a",
		-- Override the default decrement mapping with <leader>x.
		decrement = "<leader>x",
	},
})
