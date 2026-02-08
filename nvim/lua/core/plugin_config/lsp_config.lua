-- File: lua/core/plugin_config/lsp_config.lua
-- Plugin: mason.nvim + mason-lspconfig.nvim + Neovim LSP (0.11+)
-- Goal: stable LSP setup + buffer-local keymaps + cmp capabilities
-- Note: lsp_signature is configured separately in lsp_signature.lua (setup + LspAttach auto-attach)

---------------------------------------------------------------------
-- Setup: mason + mason-lspconfig
---------------------------------------------------------------------
local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
	return
end

local mason_lsp_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lsp_ok then
	return
end

-- Load lspconfig definitions so vim.lsp.config can use them (Neovim 0.11+).
local lspconfig_ok = pcall(require, "lspconfig")
if not lspconfig_ok then
	return
end

-- nvim-cmp enhanced LSP capabilities.
local cmp_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_lsp_ok then
	return
end

mason.setup()

mason_lspconfig.setup({
	-- Ensure these servers are installed automatically via Mason.
	ensure_installed = {
		"lua_ls", -- Lua
		"pyright", -- Python
		"ruff", -- Python linting & formatting
		"html", -- HTML
		"texlab", -- LaTeX
	},
	-- Auto-install any configured servers that are missing.
	automatic_installation = true,
})

---------------------------------------------------------------------
-- Capabilities: advertise completion support to LSP servers
---------------------------------------------------------------------
local capabilities = cmp_nvim_lsp.default_capabilities()

---------------------------------------------------------------------
-- on_attach: run when an LSP client attaches to a buffer
---------------------------------------------------------------------
local keymap = vim.keymap

local on_attach = function(client, bufnr)
	vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
	local opts = { buffer = bufnr, noremap = true, silent = true }

	-- Navigation
	keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
	keymap.set("n", "gr", function() require("telescope.builtin").lsp_references() end, opts)
	keymap.set("n", "K", vim.lsp.buf.hover, opts)

	-- Code actions & refactoring
	keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
	keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

	-- Diagnostics
	keymap.set("n", "<leader>D", function() require("telescope.builtin").diagnostics({ bufnr = 0 }) end, opts)
	keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
	keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, opts)
	keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, opts)
	keymap.set("n", "[e", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR }) end, opts)
	keymap.set("n", "]e", function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR }) end, opts)

	-- Symbols & call hierarchy
	keymap.set("n", "<leader>o", function() require("telescope.builtin").lsp_document_symbols() end, opts)
	keymap.set("n", "<leader>ci", vim.lsp.buf.incoming_calls, opts)
	keymap.set("n", "<leader>co", vim.lsp.buf.outgoing_calls, opts)

	-- Pyright-specific
	if client.name == "pyright" then
		keymap.set("n", "<leader>si", "<cmd>PyrightOrganizeImports<CR>", opts)
	end
end

---------------------------------------------------------------------
-- Register + enable servers (Neovim 0.11+)
---------------------------------------------------------------------
local servers = { "lua_ls", "pyright", "ruff", "html", "texlab" }

for _, server_name in ipairs(servers) do
	-- Register config for this server.
	vim.lsp.config(server_name, {
		on_attach = on_attach,
		capabilities = capabilities,
	})

	-- Enable the server for matching filetypes.
	vim.lsp.enable(server_name)
end

---------------------------------------------------------------------
-- Extra safety: ensure omnifunc stays correct even if overwritten later
---------------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "Ensure omnifunc is set for LSP buffers",
	callback = function(args)
		vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
	end,
})

