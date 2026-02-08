-- Plugin: telescope.nvim

-- Setup
local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
	return
end

local actions_ok, actions = pcall(require, "telescope.actions")
if not actions_ok then
	return
end

local builtin_ok, builtin = pcall(require, "telescope.builtin")
if not builtin_ok then
	return
end

local themes_ok, themes = pcall(require, "telescope.themes")
if not themes_ok then
	return
end

-- Keymaps
-- Keymap: find files.
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
-- Keymap: list recently opened files.
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Recent files" })
-- Keymap: live grep in workspace.
vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Live grep" })
-- Keymap: grep the word under cursor.
vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Grep string" })
-- Keymap: list open buffers.
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
-- Keymap: search help tags.
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })


telescope.setup({
	defaults = {
		mappings = {
			i = {
				-- Send results to quickfix and open the quickfix list.
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
			},
		},
	},
	extensions = {
		-- Use a dropdown UI for select prompts.
		["ui-select"] = {
			themes.get_dropdown({}),
		},
		-- Enable fuzzy matching and faster sorters via fzf-native.
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

-- Extensions
-- Load the fzf-native extension if installed.
pcall(telescope.load_extension, "fzf")
-- Load the ui-select extension if installed.
pcall(telescope.load_extension, "ui-select")
