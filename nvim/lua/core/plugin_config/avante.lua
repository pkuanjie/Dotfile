-- File: lua/core/plugin_config/avante.lua
-- Plugin: avante.nvim
-- Goal:
--   1) Use Claude as the provider
--   2) Replace Meta-key mappings with Ctrl-key mappings (suggestion + submit)

-- Setup
local ok, avante = pcall(require, "avante")
if not ok then
	return
end

avante.setup({
	---------------------------------------------------------------------
	-- Provider
	---------------------------------------------------------------------
	-- Use Claude as the default provider.
	provider = "claude",

	-- Provider configurations.
	-- Note: auth_type can be "api" (API key) or (if supported by your setup) "max".
	-- If you are using Claude Max login via ACP (claude-code), that is a different path
	-- (acp_providers) and not this HTTP provider config.
	providers = {
		claude = {
			endpoint = "https://api.anthropic.com",
			model = "claude-sonnet-4-20250514",
			auth_type = "max",
			timeout = 30000, -- Timeout in milliseconds
			extra_request_body = {
				temperature = 0.75,
				max_tokens = 20480,
			},
		},
	},

	---------------------------------------------------------------------
	-- Keymaps / mappings (replace Meta with Ctrl)
	---------------------------------------------------------------------
	mappings = {
		-- Suggestion popups / inline suggestions.
		suggestion = {
			-- Accept the current suggestion.
			accept = "<C-y>",
			-- Next suggestion.
			next = "<C-n>",
			-- Previous suggestion.
			prev = "<C-p>",
			-- Dismiss suggestion (Ctrl-[ is the same as Esc in many terminals).
			dismiss = "<C-[>",
		},
		diff = {
			ours = "co",
			theirs = "ct",
			all_theirs = "ca",
			both = "cb",
			cursor = "cc",
			next = "]x",
			prev = "[x",
		},
		jump = {
			next = "]]",
			prev = "[[",
		},
		submit = {
			normal = "<CR>",
			insert = "<C-s>",
		},
		cancel = {
			normal = { "<C-c>", "<Esc>", "q" },
			insert = { "<C-c>" },
		},
		sidebar = {
			apply_all = "A",
			apply_cursor = "a",
			retry_user_request = "r",
			edit_user_request = "e",
			switch_windows = "<Tab>",
			reverse_switch_windows = "<S-Tab>",
			remove_file = "d",
			add_file = "@",
			close = { "<Esc>", "q" },
			close_from_input = nil, -- e.g., { normal = "<Esc>", insert = "<C-d>" }
		},
	},
})
