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
		"pyright", -- Python type checking / completion
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

-- Optional but recommended:
-- Force a consistent position encoding across clients to avoid UTF-16 vs UTF-8 warnings.
-- This mostly prevents jump/diagnostic offset issues when multiple LSP clients attach.
capabilities.general = capabilities.general or {}
capabilities.general.positionEncodings = { "utf-16" }

---------------------------------------------------------------------
-- Python env detection (for Pyright)
---------------------------------------------------------------------
-- Detect the Python executable from Neovim's *current process* environment.
-- Priority:
-- 1) venv:     $VIRTUAL_ENV/bin/python
-- 2) conda:    $CONDA_PREFIX/bin/python
-- 3) PATH:     python3 or python
local function detect_python()
	if vim.env.VIRTUAL_ENV and vim.env.VIRTUAL_ENV ~= "" then
		return vim.fs.joinpath(vim.env.VIRTUAL_ENV, "bin", "python")
	end

	if vim.env.CONDA_PREFIX and vim.env.CONDA_PREFIX ~= "" then
		return vim.fs.joinpath(vim.env.CONDA_PREFIX, "bin", "python")
	end

	local py3 = vim.fn.exepath("python3")
	if py3 ~= "" then
		return py3
	end

	return vim.fn.exepath("python")
end

-- Derive (venvPath, venv) pair from env vars when possible.
-- This helps Pyright resolve third-party packages more reliably.
local function detect_venv_info()
	-- venv example:
	--   VIRTUAL_ENV=/path/to/project/.venv
	--   venvPath=/path/to/project, venv=.venv
	if vim.env.VIRTUAL_ENV and vim.env.VIRTUAL_ENV ~= "" then
		local venv_dir = vim.env.VIRTUAL_ENV
		local venv = vim.fn.fnamemodify(venv_dir, ":t")
		local venvPath = vim.fn.fnamemodify(venv_dir, ":h")
		return venvPath, venv
	end

	-- conda example:
	--   CONDA_PREFIX=/opt/miniconda3/envs/myenv
	--   venvPath=/opt/miniconda3/envs, venv=myenv
	if vim.env.CONDA_PREFIX and vim.env.CONDA_PREFIX ~= "" then
		local prefix = vim.env.CONDA_PREFIX
		local venv = vim.fn.fnamemodify(prefix, ":t")
		local venvPath = vim.fn.fnamemodify(prefix, ":h")
		return venvPath, venv
	end

	return nil, nil
end

-- Build Pyright settings dynamically from the current environment.
local function make_pyright_settings()
	local pythonPath = detect_python()
	local venvPath, venv = detect_venv_info()

	return {
		python = {
			-- Tell Pyright which interpreter to use for import resolution.
			pythonPath = pythonPath,

			-- Help Pyright locate site-packages for third-party libs (numpy, etc.).
			-- These are best-effort; if nil, Pyright falls back to auto detection.
			venvPath = venvPath,
			venv = venv,

			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
			},
		},
	}
end

---------------------------------------------------------------------
-- on_attach: run when an LSP client attaches to a buffer
---------------------------------------------------------------------
local keymap = vim.keymap

local on_attach = function(client, bufnr)
	-- Keep omnifunc enabled. nvim-cmp can use this as a backend; it doesn't "fight" cmp.
	vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
	local opts = { buffer = bufnr, noremap = true, silent = true }

	-- Navigation
	keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
	keymap.set("n", "gr", function()
		require("telescope.builtin").lsp_references()
	end, opts)
	keymap.set("n", "K", vim.lsp.buf.hover, opts)

	-- Code actions & refactoring
	keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
	keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

	-- Diagnostics
	keymap.set("n", "<leader>D", function()
		require("telescope.builtin").diagnostics({ bufnr = 0 })
	end, opts)
	keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
	keymap.set("n", "[d", function()
		vim.diagnostic.jump({ count = -1 })
	end, opts)
	keymap.set("n", "]d", function()
		vim.diagnostic.jump({ count = 1 })
	end, opts)
	keymap.set("n", "[e", function()
		vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
	end, opts)
	keymap.set("n", "]e", function()
		vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
	end, opts)

	-- Symbols & call hierarchy
	keymap.set("n", "<leader>o", function()
		require("telescope.builtin").lsp_document_symbols()
	end, opts)
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
	-- Base config shared by all servers.
	local cfg = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	-- Server-specific config overrides.
	if server_name == "pyright" then
		-- Dynamic python environment settings at startup.
		cfg.settings = make_pyright_settings()

		-- Recompute settings when a new root/workspace is detected.
		cfg.on_new_config = function(new_config, _new_root_dir)
			new_config.settings = new_config.settings or {}
			new_config.settings = vim.tbl_deep_extend("force", new_config.settings, make_pyright_settings())
		end
	end

	-- Register config for this server.
	vim.lsp.config(server_name, cfg)

	-- Enable the server for matching filetypes.
	vim.lsp.enable(server_name)
end

---------------------------------------------------------------------
-- User command: force Pyright to re-detect current python env and restart
---------------------------------------------------------------------
-- Use this after you switch venv/conda env *inside Neovim*.
-- If you switched env outside Neovim, you typically need to restart Neovim
-- (because Neovim process env vars won't change automatically).
vim.api.nvim_create_user_command("PyrightUseCurrentPython", function()
	-- Update settings for any active pyright clients.
	for _, client in ipairs(vim.lsp.get_clients({ name = "pyright" })) do
		client.config.settings = vim.tbl_deep_extend("force", client.config.settings or {}, make_pyright_settings())
		client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
	end

	-- Restart pyright to fully reload import resolution and site-packages.
	vim.cmd("LspRestart pyright")
end, { desc = "Pyright: re-detect current python env and restart" })

---------------------------------------------------------------------
-- Extra safety: ensure omnifunc stays correct even if overwritten later
---------------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "Ensure omnifunc is set for LSP buffers",
	callback = function(args)
		vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
	end,
})
