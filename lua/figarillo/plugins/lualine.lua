---@diagnostic disable: undefined-field, inject-field

local p = require("catppuccin.palettes").get_palette("mocha")
local icons = require("lazyvim.config").icons

-- Map catppuccin mocha onto the names this file uses
local colors = {
  bg = p.mantle,
  bg_dark = p.crust,
  bg_highlight = p.surface0,
  fg_gutter = p.surface0,
  fg_sidebar = p.subtext0,
  inactive_fg = p.overlay1,
  black = p.crust,
  blue = p.blue,
  green = p.green,
  red = p.red,
  magenta = p.mauve,
  yellow = p.yellow,
  orange = p.peach,
  cyan = p.sky,
  teal = p.teal,
}

local modecolor = {
  n = colors.blue,
  i = colors.green,
  v = colors.magenta,
  V = colors.magenta,
  [""] = colors.magenta,
  c = colors.yellow,
  no = colors.red,
  s = colors.yellow,
  S = colors.yellow,
  [""] = colors.yellow,
  ic = colors.yellow,
  R = colors.green,
  Rv = colors.magenta,
  cv = colors.red,
  ce = colors.red,
  r = colors.cyan,
  rm = colors.cyan,
  ["r?"] = colors.cyan,
  ["!"] = colors.red,
  t = colors.teal,
}

local theme = {
  normal = {
    a = { bg = colors.blue, fg = colors.black },
    b = { bg = colors.fg_gutter, fg = colors.blue },
    c = { bg = colors.bg, fg = colors.fg_sidebar },
    z = { bg = colors.blue, fg = colors.bg },
  },
  insert = {
    a = { bg = colors.green, fg = colors.black },
    b = { bg = colors.fg_gutter, fg = colors.yellow },
  },
  visual = {
    a = { bg = colors.magenta, fg = colors.black },
    b = { bg = colors.fg_gutter, fg = colors.magenta },
  },
  replace = {
    a = { bg = colors.red, fg = colors.black },
    b = { bg = colors.fg_gutter, fg = colors.magenta },
  },
  terminal = {
    a = { bg = colors.teal, fg = colors.black },
    b = { bg = colors.fg_gutter, fg = colors.teal },
  },
}

local mode = {
  "mode",
  separator = { left = "", right = "" },
  color = function()
    local mode_color = modecolor
    return { bg = mode_color[vim.fn.mode()], fg = colors.black, gui = "bold" }
  end,
}

local space = {
  function()
    return " "
  end,
  color = { bg = colors.bg, fg = colors.blue },
}

local diff = {
  "diff",
  color = { bg = colors.bg, fg = colors.blue, gui = "bold" },
  symbols = {
    added = icons.git.added,
    modified = icons.git.modified,
    removed = icons.git.removed,
  },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.yellow },
    removed = { fg = colors.red },
  },
}

local diagnostics = {
  "diagnostics",
  color = { bg = colors.bg, fg = colors.blue, gui = "bold" },
  symbols = {
    error = icons.diagnostics.Error,
    warn = icons.diagnostics.Warn,
    info = icons.diagnostics.Info,
    hint = icons.diagnostics.Hint,
  },
  diagnostics_color = {
    error = { fg = colors.red },
    warn = { fg = colors.yellow },
    info = { fg = colors.magenta },
    hint = { fg = colors.cyan },
  },
}

local buffers = {
  "buffers",
  separator = { left = "", right = "" },
  show_filename_only = true,
  hide_filename_extension = false,
  show_modified_status = false,
  mode = 0,
  max_length = vim.o.columns * 2 / 3,
  filetype_names = {
    TelescopePrompt = "Telescope",
    dashboard = "Dashboard",
    packer = "Packer",
    fzf = "FZF",
    alpha = "Alpha",
  },
  buffers_color = {
    active = { bg = colors.blue, fg = colors.bg }, -- color for active buffer
    inactive = { bg = colors.bg_dark, fg = colors.inactive_fg }, -- color for inactive buffer
  },
  symbols = {
    modified = "●",
    alternate_file = "",
    directory = " ",
  },
}

local command = {
  function()
    return require("noice").api.status.command.get()
  end,
  cond = function()
    return package.loaded["noice"] and require("noice").api.status.command.has()
  end,
  separator = { left = "" },
  color = { bg = colors.bg_highlight, fg = colors.orange, gui = "italic,bold" },
}

local status_mode = {
  function()
    return require("noice").api.status.mode.get()
  end,
  cond = function()
    return package.loaded["noice"] and require("noice").api.status.mode.has()
  end,
  separator = { left = "" },
  color = { bg = colors.bg_highlight, fg = colors.red, gui = "italic,bold" },
}

local dap = {
  function()
    return "  " .. require("dap").status()
  end,
  cond = function()
    return package.loaded["dap"] and require("dap").status() ~= ""
  end,
  -- color = Util.fg("Debug"),
}

local clock = {
  color = { bg = colors.blue, fg = colors.black, gui = "bold" },
  separator = { left = "", right = "" },
  function()
    return " " .. os.date("%R")
  end,
}

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  priority = 1000,
  opts = {
    options = {
      theme = theme,
      globalstatus = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { statusline = { "dashboard", "packer", "NVimTree", "alpha" } },
      icons_enabled = true,
      ignore_focus = {},
      always_divide_middle = true,
    },
    sections = {
      lualine_a = { mode },
      lualine_b = { space, diff, diagnostics },
      lualine_c = { space, buffers },
      lualine_x = { space },
      lualine_y = { command, status_mode, dap },
      lualine_z = { clock },
    },
    extensions = { "lazy" },
  },
}
