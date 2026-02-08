-- Plugin: nvim-treesitter

-- Setup
local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
	return
end

configs.setup({
	-- Install and maintain parsers for these languages.
	ensure_installed = {
		"bash", -- Parser for bash files.
		"css", -- Parser for CSS files.
		"dockerfile", -- Parser for Dockerfiles.
		"gitignore", -- Parser for .gitignore files.
		"html", -- Parser for HTML files.
		"json", -- Parser for JSON files.
		"latex", -- Parser for LaTeX files.
		"lua", -- Parser for Lua files.
		"markdown", -- Parser for Markdown files.
		"markdown_inline", -- Parser for inline Markdown.
		"python", -- Parser for Python files.
		"vim", -- Parser for Vimscript files.
		"yaml", -- Parser for YAML files.
	},
	-- Do not block startup while installing parsers.
	sync_install = false,
	-- Auto-install missing parsers on buffer enter.
	auto_install = true,
	-- Enable Treesitter-powered highlighting (non-regex highlighting).
	highlight = { enable = true },
	-- Enable Treesitter-based indentation where supported.
	indent = { enable = true },
	-- Note: nvim-ts-autotag is configured via its own setup(), not here.
	textobjects = {
		select = {
			enable = true,
			-- Jump forward automatically to the nearest textobject.
			lookahead = true,
			-- Define custom textobject selection mappings.
			keymaps = {
				["af"] = "@function.outer", -- Select around function.
				["if"] = "@function.inner", -- Select inside function.
				["ac"] = "@class.outer", -- Select around class.
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" }, -- Select inside class.
				["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" }, -- Select around scope.
			},
			-- Choose selection modes per textobject (charwise/linewise/blockwise).
			selection_modes = {
				["@parameter.outer"] = "v", -- Use character-wise selection for parameters.
				["@function.outer"] = "V", -- Use line-wise selection for functions.
				["@class.outer"] = "<c-v>", -- Use block-wise selection for classes.
			},
			-- Extend selection to include surrounding whitespace.
			include_surrounding_whitespace = true,
		},
		swap = {
			enable = true,
			-- Swap function parameters with custom mappings.
			swap_next = {
				["<leader>sn"] = "@parameter.inner", -- Swap with next parameter.
			},
			swap_previous = {
				["<leader>sp"] = "@parameter.inner", -- Swap with previous parameter.
			},
		},
		move = {
			enable = true,
			-- Add textobject motions and record them in the jumplist.
			set_jumps = true,
			goto_next_start = {
				["]m"] = "@function.outer", -- Next function start.
				["]]"] = { query = "@class.outer", desc = "Next class start" }, -- Next class start.
				["]o"] = "@loop.*", -- Next loop start.
				["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" }, -- Next scope start.
				["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" }, -- Next fold start.
			},
			goto_next_end = {
				["]M"] = "@function.outer", -- Next function end.
				["]["] = "@class.outer", -- Next class end.
			},
			goto_previous_start = {
				["[m"] = "@function.outer", -- Previous function start.
				["[["] = "@class.outer", -- Previous class start.
			},
			goto_previous_end = {
				["[M"] = "@function.outer", -- Previous function end.
				["[]"] = "@class.outer", -- Previous class end.
			},
			goto_next = {
				["]i"] = "@conditional.outer", -- Next conditional block.
			},
			goto_previous = {
				["[i"] = "@conditional.outer", -- Previous conditional block.
			},
		},
		lsp_interop = {
			enable = true,
			-- Provide LSP-like peek definition windows for Treesitter textobjects.
			border = "none",
			floating_preview_opts = {},
			peek_definition_code = {
				["<leader>df"] = "@function.outer", -- Peek function definition.
				["<leader>dF"] = "@class.outer", -- Peek class definition.
			},
		},
	},
})

local repeatable_ok, ts_repeat_move = pcall(require, "nvim-treesitter.textobjects.repeatable_move")
if not repeatable_ok then
	return
end

-- Keymaps
-- Repeat the last textobject move with ;
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
-- Repeat the last textobject move in reverse with ,
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
