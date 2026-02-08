-- Plugin: Neovim LSP (0.11+)

-- LSP configs (Neovim 0.11+)
-- Use vim.lsp.config and vim.lsp.enable instead of require("lspconfig").
-- Use completion capabilities from nvim-cmp if available, otherwise fall back to defaults.
local capabilities = vim.g.lsp_capabilities or vim.lsp.protocol.make_client_capabilities()

for _, server_name in ipairs({ "lua_ls", "pyright", "html", "texlab" }) do
	-- Register config (defaults + completion capabilities).
	vim.lsp.config(server_name, {
		capabilities = capabilities,
	})
	-- Enable the server for matching filetypes.
	vim.lsp.enable(server_name)
end
