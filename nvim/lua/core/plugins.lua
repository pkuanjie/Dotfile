-- Automatically download the lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
		branch = "main",
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
	{ "glepnir/lspsaga.nvim", branch = "main" },
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
	"github/copilot.vim",

	-- Formatting / linting / refactor
	"nvimtools/none-ls.nvim", -- configure formatters & linters
	"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls
	"ThePrimeagen/refactoring.nvim",

	-- Treesitter & text objects
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
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
	{
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
	},
	{ "mg979/vim-visual-multi", branch = "master" },

	-- Window / split / tmux
	"christoomey/vim-tmux-navigator",
	"szw/vim-maximizer",

	-- Git
	"lewis6991/gitsigns.nvim",

	-- Terminal
	{ "akinsho/toggleterm.nvim", version = "*" },

	-- LaTeX
	"lervag/vimtex",

	-- Claude code
	{
		"coder/claudecode.nvim",
		dependencies = { "folke/snacks.nvim" },
	},
})
