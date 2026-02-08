-- Plugin: nvim-cmp + LuaSnip + lspkind

-- Setup
local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
	return
end

local luasnip_ok, luasnip = pcall(require, "luasnip")
if not luasnip_ok then
	return
end

local lspkind_ok, lspkind = pcall(require, "lspkind")
if not lspkind_ok then
	return
end

local cmp_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_lsp_ok then
	return
end

-- Advertise completion capabilities to LSP servers (shared via vim.g).
vim.g.lsp_capabilities = cmp_nvim_lsp.default_capabilities()

-- Load VS Code-style snippets from friendly-snippets (non-default behavior).
require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		-- Scroll completion documentation up by 4 lines.
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		-- Scroll completion documentation down by 4 lines.
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		-- Trigger completion menu manually.
		["<C-i>"] = cmp.mapping.complete(),
		-- Close the completion menu without selecting.
		["<C-e>"] = cmp.mapping.abort(),
		-- Confirm the selected item; do not auto-select the first item.
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
	snippet = {
		-- Use LuaSnip to expand completion snippets.
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		-- Enable LSP completion source.
		{ name = "nvim_lsp" },
		-- Enable LuaSnip completion source.
		{ name = "luasnip" },
		-- Enable buffer words completion source.
		{ name = "buffer" },
		-- Enable filesystem path completion source.
		{ name = "path" },
	}),
	formatting = {
		-- Add VS Code-like icons to completion items.
		format = lspkind.cmp_format({
			-- Truncate long completion entries at 50 characters.
			maxwidth = 50,
			-- Show ellipsis when items are truncated.
			ellipsis_char = "...",
		}),
	},
})

-- Command-line completion
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		-- Use current buffer content for search completion.
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		-- Use filesystem paths for command-line completion.
		{ name = "path" },
	}, {
		{
			name = "cmdline",
			-- Exclude these commands from cmdline completion.
			option = { ignore_cmds = { "Man", "!" } },
		},
	}),
})
