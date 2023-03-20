-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters
local code_actions = null_ls.builtins.code_actions -- to setup code actions

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
	-- setup formatters & linters
	sources = {
		--  to disable file types use
		--  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
		formatting.stylua.with({ filetypes = { "lua" } }),
		formatting.black.with({ filetypes = { "python" } }),
		-- diagnostics
		diagnostics.cspell.with({ filetypes = { "markdown", "tex" } }),
		diagnostics.markdownlint.with({ filetypes = { "markdown" } }),
		-- code actions
		code_actions.cspell,
		code_actions.refactoring,
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"stylua", -- lua formatter
		"cspell",
		"markdownlint",
		"black",
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})

-- using null_ls for formatting
vim.keymap.set("n", "<leader>fm", ":lua vim.lsp.buf.formatting_sync()<CR>", { silent = true })
