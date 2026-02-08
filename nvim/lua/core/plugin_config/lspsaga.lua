-- Plugin: lspsaga.nvim

-- Setup
local ok, saga = pcall(require, "lspsaga")
if not ok then
	return
end

saga.setup({
	-- Use Ctrl+f / Ctrl+b to scroll the Lspsaga preview window.
	scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
	definition = {
		-- Open definition with Enter from the preview window.
		edit = "<CR>",
	},
	ui = {
		-- Custom background color for the Lspsaga UI.
		colors = { normal_bg = "#022746" },
	},
})

-- Keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end

		-- Enable completion triggered by <C-x><C-o>.
		vim.api.nvim_buf_set_option(args.buf, "omnifunc", "v:lua.vim.lsp.omnifunc")

		local opts = { buffer = args.buf, noremap = true, silent = true }
		local keymap = vim.keymap

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
		keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts) -- see outline on right hand side

		-- Call hierarchy
		keymap.set("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", opts)
		keymap.set("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", opts)

		-- sort import using pyright
		if client.name == "pyright" then
			keymap.set("n", "<leader>si", "<cmd>PyrightOrganizeImports<CR>", opts)
		end
	end,
})
