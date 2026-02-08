-- Plugin: Comment.nvim

-- Setup
local ok, comment = pcall(require, "Comment")
if not ok then
	return
end

comment.setup({
	-- Add a space between the comment leader and the text (non-default behavior).
	padding = true,
	-- Keep the cursor position after commenting/uncommenting (non-default behavior).
	sticky = true,
	-- Do not ignore any lines while commenting (explicitly set).
	ignore = nil,
	toggler = {
		-- Custom line comment toggle mapping.
		line = "gcc",
		-- Custom block comment toggle mapping.
		block = "gbc",
	},
	opleader = {
		-- Custom operator-pending line comment mapping.
		line = "gc",
		-- Custom operator-pending block comment mapping.
		block = "gb",
	},
	extra = {
		-- Custom mapping to add a comment above the current line.
		above = "gcO",
		-- Custom mapping to add a comment below the current line.
		below = "gco",
		-- Custom mapping to add a comment at end of line.
		eol = "gcA",
	},
	mappings = {
		-- Enable the plugin's basic mappings (gcc/gbc/gc/gb).
		basic = true,
		-- Enable the plugin's extra mappings (gco/gcO/gcA).
		extra = true,
	},
	-- No pre-hook customization (explicitly set to default).
	pre_hook = nil,
	-- No post-hook customization (explicitly set to default).
	post_hook = nil,
})
