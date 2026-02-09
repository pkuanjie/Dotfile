-- Automatically download the lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Theme & UI
	"folke/tokyonight.nvim",
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	"lukas-reineke/indent-blankline.nvim",
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	"yamatsum/nvim-cursorline",
	"mbbill/undotree",

	-- File navigation
	"nvim-tree/nvim-tree.lua",
	"stevearc/oil.nvim",

	-- Fuzzy finder / picker
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"nvim-telescope/telescope-ui-select.nvim", -- for showing lsp code actions
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- LSP core & UI
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"onsails/lspkind-nvim",
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
	},

	-- Completion & snippets
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",

	-- Treesitter & text objects
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},
	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter" },
	},

	-- Editing helpers
	"numToStr/Comment.nvim",
	"windwp/nvim-autopairs",
	{ "kylechui/nvim-surround", version = "*" },
	"windwp/nvim-ts-autotag",
	"ethanholz/nvim-lastplace",
	"ConradIrwin/vim-bracketed-paste",
	"nat-418/boole.nvim",
	"chentoast/marks.nvim",

	-- Motion / multi-cursor
	{ "folke/flash.nvim", event = "VeryLazy" },
	{ "mg979/vim-visual-multi", branch = "master" },

	-- Window / split / tmux
	"christoomey/vim-tmux-navigator",
	"szw/vim-maximizer",

	-- Git
	"lewis6991/gitsigns.nvim",

	-- LaTeX
	"lervag/vimtex",

	-- Formatting
	"stevearc/conform.nvim",

	-- Keymap discovery
	{ "folke/which-key.nvim", event = "VeryLazy" },

	-- AI
	"github/copilot.vim",
	{
		"coder/claudecode.nvim",
		dependencies = { "folke/snacks.nvim" },
	},
	{
		"yetone/avante.nvim",
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		-- ⚠️ must add this setting! ! !
		build = vim.fn.has("win32") ~= 0
				and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
			or "make",
		event = "VeryLazy",
		version = false, -- Never set this value to "*"! Never!
		---@module 'avante'
		---@type avante.Config
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"nvim-mini/mini.pick", -- for file_selector provider mini.pick
			"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			"ibhagwan/fzf-lua", -- for file_selector provider fzf
			"stevearc/dressing.nvim", -- for input provider dressing
			"folke/snacks.nvim", -- for input provider snacks
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
})
