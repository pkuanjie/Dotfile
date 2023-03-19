-- Automatically download the packer plugin manager
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save this file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	-- My plugins here

	-- Theme
	use("folke/tokyonight.nvim")

	-- File explorer
	use("nvim-tree/nvim-tree.lua")

	-- Status line
	use("nvim-tree/nvim-web-devicons")
	use("nvim-lualine/lualine.nvim")

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
	use("ThePrimeagen/refactoring.nvim")

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- File finder
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("nvim-telescope/telescope-ui-select.nvim") -- for showing lsp code actions

	-- LSP
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})
	use("onsails/lspkind-nvim")
	use({ "glepnir/lspsaga.nvim", branch = "main" })

	-- Autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- copilot
	use("github/copilot.vim")

	-- commenting
	use("numToStr/Comment.nvim")

	-- editing pairs
	use("windwp/nvim-autopairs")
	use({ "kylechui/nvim-surround", tag = "*" })

	-- window management
	use("christoomey/vim-tmux-navigator")
	use("szw/vim-maximizer")

	-- git
	use("lewis6991/gitsigns.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
