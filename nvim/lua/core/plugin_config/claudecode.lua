-- Plugin: claudecode.nvim

-- Setup
local ok, claudecode = pcall(require, "claudecode")
if not ok then
	return
end

claudecode.setup({
	-- Use default plugin configuration.
	terminal = {
		split_side = "right", -- "left" or "right"
		split_width_percentage = 0.40,
		provider = "auto", -- "auto", "snacks", "native", "external", "none", or custom provider table
		auto_close = true,
		snacks_win_opts = {}, -- Opts to pass to `Snacks.terminal.open()` - see Floating Window section below

		-- Provider-specific options
		provider_opts = {
			-- Command for external terminal provider. Can be:
			-- 1. String with %s placeholder: "alacritty -e %s" (backward compatible)
			-- 2. String with two %s placeholders: "alacritty --working-directory %s -e %s" (cwd, command)
			-- 3. Function returning command: function(cmd, env) return "alacritty -e " .. cmd end
			external_terminal_cmd = nil,
		},
	},
})

---------------------------------------------------------------------
-- Keymaps
---------------------------------------------------------------------

-- Main Claude toggle
vim.keymap.set("n", "<leader>ac", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude" })

-- Focus Claude UI
vim.keymap.set("n", "<leader>af", "<cmd>ClaudeCodeFocus<cr>", { desc = "Focus Claude" })

-- Resume last session
vim.keymap.set("n", "<leader>ar", "<cmd>ClaudeCode --resume<cr>", { desc = "Resume Claude" })

-- Continue session
vim.keymap.set("n", "<leader>aC", "<cmd>ClaudeCode --continue<cr>", { desc = "Continue Claude" })

-- Model selector
vim.keymap.set("n", "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", { desc = "Select Claude model" })

-- Add current buffer to Claude context
vim.keymap.set("n", "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", { desc = "Add current buffer" })

-- Send visual selection
vim.keymap.set("v", "<leader>as", "<cmd>ClaudeCodeSend<cr>", { desc = "Send to Claude" })

-- File tree integrations
vim.keymap.set("n", "<leader>as", "<cmd>ClaudeCodeTreeAdd<cr>", {
	desc = "Add file",
})

-- Diff operations
vim.keymap.set("n", "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", { desc = "Accept diff" })
vim.keymap.set("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", { desc = "Deny diff" })
