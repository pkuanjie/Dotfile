-- Plugin: mason.nvim + mason-lspconfig.nvim + Neovim LSP (0.11+)

-- Setup
local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
	return
end

local mason_lsp_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lsp_ok then
	return
end

-- Load lspconfig definitions so vim.lsp.config can use them.
local lspconfig_ok = pcall(require, "lspconfig")
if not lspconfig_ok then
	return
end

local cmp_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_lsp_ok then
	return
end

mason.setup()

mason_lspconfig.setup({
	-- Ensure these servers are installed automatically via Mason.
	ensure_installed = {
		"lua_ls", -- Ensure Lua language server is installed.
		"pyright", -- Ensure Python language server is installed.
		"html", -- Ensure HTML language server is installed.
		"texlab", -- Ensure LaTeX language server is installed.
	},
	-- Auto-install any configured servers that are missing.
	automatic_installation = true,
})

-- Capabilities
-- Advertise completion capabilities to LSP servers.
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Keymaps
local keymap = vim.keymap

local on_attach = function(client, bufnr)
	-- Enable completion triggered by <C-x><C-o>.
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Buffer-local mappings.
	local opts = { buffer = bufnr, noremap = true, silent = true }
	-- Enable lsp_signature per-buffer when available.
	local sig_ok, sig = pcall(require, "lsp_signature")
	if sig_ok then
		sig.on_attach({}, bufnr)
	end

	-- set keymaps for using telescope
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

	-- set keymaps for using lspsaga
	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", opts) -- go to implementation
	keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	keymap.set("n", "<leader>D", "<cmd>Lspsaga show_buffer_diagnostics<CR>", opts) -- show  diagnostics for file
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	-- Diagnostic jump with filters such as only jumping to an error
	keymap.set("n", "[e", function()
		require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end, opts)
	keymap.set("n", "]e", function()
		require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
	end, opts)
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>") -- see outline on right hand side

	-- Call hierarchy
	keymap.set("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", opts)
	keymap.set("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", opts)

	-- sort import using pyright
	if client.name == "pyright" then
		keymap.set("n", "<leader>si", "<cmd>PyrightOrganizeImports<CR>")
	end
end

-- LSP configs (Neovim 0.11+)
-- Use vim.lsp.config and vim.lsp.enable instead of require("lspconfig").
for _, server_name in ipairs({ "lua_ls", "pyright", "html", "texlab" }) do
	-- Register config (defaults + keymaps + completion capabilities).
	vim.lsp.config(server_name, {
		on_attach = on_attach,
		capabilities = capabilities,
	})
	-- Enable the server for matching filetypes.
	vim.lsp.enable(server_name)
end
