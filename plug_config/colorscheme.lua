-- ===================== Neovim API aliases ====================
local cmd = vim.cmd                                             -- execute Vim commands                                               -- global variables


-- ==========================================================
--                         PLUG CONFIG
-- ==========================================================

cmd[[let g:dracula_colorterm = 0]]
cmd[[colorscheme onedarkpro]]

require('onedarkpro').setup({
  theme = "onedark_vivid",
  options = {
      bold = true, -- Use the colorscheme's opinionated bold styles?
      italic = true, -- Use the colorscheme's opinionated italic styles?
      underline = true, -- Use the colorscheme's opinionated underline styles?
      undercurl = true, -- Use the colorscheme's opinionated undercurl styles?
      cursorline = true, -- Use cursorline highlighting?
      transparency = true, -- Use a transparent background?
      terminal_colors = true, -- Use the colorscheme's colors for Neovim's :terminal?
      window_unfocused_color = true, -- When the window is out of focus, change the normal background?
  }
})

-- ======================= Ayu config =======================
require("ayu").setup({
	dark = true,
	overrides = {}
})

-- ===================== Dracula config =====================
require("dracula").setup({
  -- customize dracula color palette
  colors = {
    bg = "#282A36",
    fg = "#F8F8F2",
    selection = "#44475A",
    comment = "#6272A4",
    red = "#FF5555",
    orange = "#FFB86C",
    yellow = "#F1FA8C",
    green = "#50fa7b",
    purple = "#BD93F9",
    cyan = "#8BE9FD",
    pink = "#FF79C6",
    bright_red = "#FF6E6E",
    bright_green = "#69FF94",
    bright_yellow = "#FFFFA5",
    bright_blue = "#D6ACFF",
    bright_magenta = "#FF92DF",
    bright_cyan = "#A4FFFF",
    bright_white = "#FFFFFF",
    menu = "#21222C",
    visual = "#3E4452",
    gutter_fg = "#4B5263",
    nontext = "#3B4048",
  },
  -- show the '~' characters after the end of buffers
  show_end_of_buffer = true, -- default false
  -- use transparent background
  transparent_bg = true, -- default false
  -- set custom lualine background color
  lualine_bg_color = "#44475a", -- default nil
  -- set italic comment
  italic_comment = true, -- default false
  -- overrides the default highlights see `:h synIDattr`
  overrides = {
    -- Examples
    -- NonText = { fg = dracula.colors().white }, -- set NonText fg to white
    -- NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
    -- Nothing = {} -- clear highlight of Nothing
  },
})
