local setup, boole = pcall(require, "boole")
if not setup then
	return
end

boole.setup({
	mappings = {
		increment = "<leader>a",
		decrement = "<leader>x",
	},
	-- User defined loops
	-- additions = {
	--   {'Foo', 'Bar'},
	--   {'tic', 'tac', 'toe'}
	-- },
	-- allow_caps_additions = {
	--   {'enable', 'disable'}
	-- enable → disable
	-- Enable → Disable
	-- ENABLE → DISABLE
	-- }
})
