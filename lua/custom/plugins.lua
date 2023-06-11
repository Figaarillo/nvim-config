local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    enabled = true,
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    config = function (_)
      require('custom.configs.onedarkpro')
    end
  },

  {
    "NvChad/nvim-colorizer.lua",
    enabled = true,
    config = function (_)
      require('colorizer').setup()
    end
  },

  {
  	"Pocco81/auto-save.nvim",
  	config = function()
  		 require("custom.configs.autosave")
  	end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function (_)
      require("custom.configs.indentblankline")
    end
  },

  {
    'codota/tabnine-nvim',
    build = "./dl_binaries.sh",
    config = function (_)
      require("custom.configs.tabnine")
    end
  }
}

return plugins
