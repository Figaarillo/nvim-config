-- ==================================================================
--                           Neovim Plugins
-- ==================================================================

-- ============================== Alias =============================
local fn = vim.fn

-- ================== Automatically install packer ==================
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
		plug,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Hava packer use a window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- ============================= Packer =============================
return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	-- =========================== Utilities ========================== Autosave
	use("Pocco81/auto-save.nvim")

	-- Autopairs
	use("windwp/nvim-autopairs")

	-- Dev icons
	use("kyazdani42/nvim-web-devicons")

	-- indent blankline
	use("lukas-reineke/indent-blankline.nvim")

	-- Color highlight
	use("NvChad/nvim-colorizer.lua")

	-- ========================= Theme colors =========================
	use("Mofiqul/dracula.nvim")
	use("olimorris/onedarkpro.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- ========================= File browser =========================
	use("kyazdani42/nvim-tree.lua")

	-- ========================== Statusline ==========================
	use("tamton-aquib/staline.nvim")

	-- ========================= Start screen =========================
	use("goolord/alpha-nvim")

	-- ======================== Todo highlight ========================
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	-- =========================== Comments ===========================
	use("numToStr/Comment.nvim")

	-- =========================== Terminal ===========================
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
	})

	-- ======================= List diagnostic =========================
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})

	-- ========================== REST Client =========================
	use({
		"rest-nvim/rest.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	-- =========================== Git plugs ==========================
	use("lewis6991/gitsigns.nvim")

	-- ========================= Fuzzi finder =========================
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use("nvim-telescope/telescope-file-browser.nvim")

	-- ====================== Autocomplete / LSP ======================
	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("hrsh7th/cmp-emoji") -- Eomojis autocompletion

	-- tabnine
	use({
		"tzachar/cmp-tabnine",
		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
	})

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/mason.nvim") -- simple to use language server installer
	use("williamboman/mason-lspconfig.nvim") -- simple to use language server installer
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- use("glepnir/lspsaga.nvim") -- provides beautiful UIs for various LSP-related features like hover doc, defenition preview, and rename actions

	-- formatting
	use("jose-elias-alvarez/null-ls.nvim")

	-- ========================== Treesitter ==========================
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- rainbow parentheses
	use("mrjones2014/nvim-ts-rainbow")

	-- autorename tags
	use("windwp/nvim-ts-autotag")
	use("nvim-treesitter/nvim-treesitter-refactor")

	-- Impreve comementrings
	use("JoosepAlviste/nvim-ts-context-commentstring")
end)
