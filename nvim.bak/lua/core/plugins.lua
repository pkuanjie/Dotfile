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
	-- My plugins here

	-- Theme
	"folke/tokyonight.nvim",

	-- File explorer
	"nvim-tree/nvim-tree.lua",

	-- Status line
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",

	-- formatting & linting
	"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
	"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls
	"ThePrimeagen/refactoring.nvim",

	-- treesitter configuration
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

	-- html auto close tag
	"windwp/nvim-ts-autotag",

	-- File finder
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"nvim-telescope/telescope-ui-select.nvim", -- for showing lsp code actions
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- LSP
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",

	"onsails/lspkind-nvim",
	{ "glepnir/lspsaga.nvim", branch = "main" },
	"ray-x/lsp_signature.nvim",

	-- Autocompletion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",

	-- snippets
	{
		"L3MON4D3/LuaSnip",
		-- install jsregexp (optional!:).
		build = "make install_jsregexp",
	},
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",

	-- copilot
	"github/copilot.vim",

	-- commenting
	"numToStr/Comment.nvim",

	-- editing pairs
	"windwp/nvim-autopairs",
	{ "kylechui/nvim-surround", version = "*" },

	-- window management
	"christoomey/vim-tmux-navigator",
	"szw/vim-maximizer",

	-- git
	"lewis6991/gitsigns.nvim",

	-- indent guides
	"lukas-reineke/indent-blankline.nvim",

	-- bufferline
	{ "akinsho/bufferline.nvim", branch = "main", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },

	-- illuminate current word
	"yamatsum/nvim-cursorline",

	-- undo tree
	"mbbill/undotree",

	-- edit folders
	"stevearc/oil.nvim",

	-- easy motion
	{
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
	},

	-- go to last place in file when reopening
	"ethanholz/nvim-lastplace",

	-- automatically set paste mode when pasting
	"ConradIrwin/vim-bracketed-paste",

	-- multi cursor support
	{ "mg979/vim-visual-multi", branch = "master" },

	-- split and join
	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter" },
	},

	-- true to false
	"nat-418/boole.nvim",

	-- terminal
	{ "akinsho/toggleterm.nvim", version = "*" },

	-- marks
	"chentoast/marks.nvim",

	-- latex
	"lervag/vimtex",
})
