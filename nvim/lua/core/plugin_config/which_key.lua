-- Plugin: which-key.nvim

-- Setup
local ok, wk = pcall(require, "which-key")
if not ok then
	return
end

wk.setup()

-- Register group labels for leader key prefixes.
wk.add({
	{ "<leader>a", group = "AI (Claude)" },
	{ "<leader>b", group = "Buffer" },
	{ "<leader>c", group = "Code/Calls" },
	{ "<leader>d", group = "Diagnostics" },
	{ "<leader>f", group = "Find" },
	{ "<leader>l", group = "LazyGit" },
	{ "<leader>r", group = "Rename/Restart" },
	{ "<leader>s", group = "Split/Swap" },
	{ "<leader>t", group = "Tab/Toggle" },
	{ "<leader>y", group = "Yank" },
	{ "<leader>p", group = "Paste" },
})
