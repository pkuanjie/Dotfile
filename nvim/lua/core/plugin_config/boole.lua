-- Plugin: boole.nvim

-- Setup
local ok, boole = pcall(require, "boole")
if not ok then
	return
end

boole.setup({
	mappings = {
		-- Use default <C-a>/<C-x> (extends vim's built-in with boolean toggling).
		increment = "<C-a>",
		decrement = "<C-x>",
	},
})
