-- Plugin: none-ls.nvim + mason-null-ls.nvim

-- Setup
local mason_null_ls_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_ok then
	return
end

local null_ls_ok, null_ls = pcall(require, "null-ls")
if not null_ls_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Set up format-on-save only when no other LSP formatter exists.
local on_attach = function(current_client, bufnr)
	-- Detect whether any non-null-ls client can format this buffer.
	local function has_other_formatter()
		for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
			-- Check for any non-null-ls client that can format.
			if client.name ~= "null-ls" and client.supports_method("textDocument/formatting") then
				return true
			end
		end
		return false
	end

	if current_client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				-- Prefer LSP server formatting when available; fall back to null-ls otherwise.
				if has_other_formatter() then
					return
				end
				vim.lsp.buf.format({
					-- Use null-ls only when no other formatter is available.
					filter = function(client)
						return client.name == "null-ls"
					end,
					bufnr = bufnr,
				})
			end,
		})
	end
end

null_ls.setup({
	sources = {
		-- Format Lua files with Stylua.
		formatting.stylua.with({ filetypes = { "lua" } }),
		-- Lint Markdown files with markdownlint.
		diagnostics.markdownlint.with({ filetypes = { "markdown" } }),
		-- Provide refactoring code actions from external tooling.
		code_actions.refactoring,
	},
	-- Enable format-on-save using null-ls when no LSP formatter exists.
	on_attach = on_attach,
})

mason_null_ls.setup({
	-- Auto-install these external tools for null-ls integration.
	ensure_installed = {
		"stylua", -- Ensure Stylua formatter is installed.
		"markdownlint", -- Ensure markdownlint is installed.
		"black", -- Ensure Black formatter is installed.
	},
	-- Install configured tools automatically.
	automatic_installation = true,
})

-- Keymaps
-- Manual format keymap using the LSP formatting API.
vim.keymap.set("n", "<leader>fm", ":lua vim.lsp.buf.format{ async = true }<CR>")
