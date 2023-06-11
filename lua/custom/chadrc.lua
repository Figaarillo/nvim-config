---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  -- theme = "everforest",
  -- theme_toggle = { "everforest", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  colorscheme = function (_)
    vim.cmd('colorscheme everforest')
  end,
  -- cmp: icon themeing
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
  },

  ------------------------------- nvchad_ui modules -----------------------------
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    overriden_modules = nil,
  },

  nvdash = {
    load_on_startup = true,
    header = {
    [[                                                  ]],
		[[███    ██ ███████  ██████  ██    ██ ██ ███    ███ ]],
		[[████   ██ ██      ██    ██ ██    ██ ██ ████  ████ ]],
		[[██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██ ]],
		[[██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██ ]],
		[[██   ████ ███████  ██████    ████   ██ ██      ██ ]],
		[[                                     by figarillo ]],
    [[                                                  ]]
    },

    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc b m", "Telescope marks" },
      { "  Themes", "Ctrl alt u", "Telescope themes" },
      { "  Mappings", "Ctrl Alt k", "NvCheatsheet" },
    },
  },

  lsp = {
    -- show function signatures i.e args as you type
    signature = {
      disabled = false,
      silent = false, -- silences 'no signature help available' message from appearing
    },
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M

