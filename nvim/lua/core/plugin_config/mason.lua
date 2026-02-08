-- Plugin: mason.nvim + mason-lspconfig.nvim

-- Setup
local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
	return
end

local mason_lsp_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lsp_ok then
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
})
