-- Plugin: conform.nvim
-- Formatters: stylua (Lua), ruff_format (Python), prettier (web/markup)

local ok, conform = pcall(require, "conform")
if not ok then
	return
end

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_format" },
		html = { "prettier" },
		css = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
	},
	format_on_save = {
		timeout_ms = 2000,
		lsp_format = "fallback",
	},
})

-- Keymap: manual format.
vim.keymap.set({ "n", "v" }, "<leader>fm", function()
	conform.format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })
