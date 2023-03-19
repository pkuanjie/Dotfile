local mason_setup, mason = pcall(require, "mason")
if not mason_setup then
	return
end

local mason_lspconfig_setup, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_setup then
	return
end

mason.setup()
mason_lspconfig.setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
	},
})

local keymap = vim.keymap

local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Buffer local mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local opts = { buffer = bufnr, noremap = true, silent = true }

	--set keymaps for using telescope
	-- keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
	-- keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- got to declaration
	-- keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- see definition and make edits in window
	-- keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- go to implementation
	-- keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- go to implementation
	-- keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions
	-- keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
	-- keymap.set("n", "<leader>rn", ":IncRename ", opts) -- smart rename
	-- keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
	-- keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
	-- keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
	-- keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
	-- keymap.set("n", "[e", vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }), opts) -- jump to previous diagnostic in buffer
	-- keymap.set("n", "]e", vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }), opts) -- jump to next diagnostic in buffer
	-- keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

	--set keymaps for using lspsaga
	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", opts) -- go to implementation
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	keymap.set("n", "<leader>D", "<cmd>Lspsaga show_buffer_diagnostics<CR>", opts) -- show  diagnostics for file
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	-- Diagnostic jump with filters such as only jumping to an error
	keymap.set("n", "[e", function()
		require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end)
	keymap.set("n", "]e", function()
		require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
	end)
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>") -- see outline on right hand side
end

local cmp_nvim_lsp_setup, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_setup then
	return
end
local capabilities = cmp_nvim_lsp.default_capabilities()

local lspconfig_setup, lspconfig = pcall(require, "lspconfig")
if not lspconfig_setup then
	return
end

lspconfig["pyright"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
