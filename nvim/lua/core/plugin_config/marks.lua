-- Plugin: marks.nvim

-- Setup
local ok, marks = pcall(require, "marks")
if not ok then
	return
end

marks.setup()
