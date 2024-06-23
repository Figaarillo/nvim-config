---@diagnostic disable: undefined-field

local colors = require("tokyonight.colors").setup()
local icons = require("lazyvim.config").icons
local Util = require("lazyvim.util").ui

colors.bg_dark = "#16161E"
colors.bg = "#1A1B26"

local modecolor = {
  n = colors.blue,
  i = colors.green,
  v = colors.red,
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
  t = colors.red,
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
    a = { bg = colors.green1, fg = colors.black },
    b = { bg = colors.fg_gutter, fg = colors.green1 },
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
    inactive = { bg = colors.bg_dark, fg = colors.fg_gutter }, -- color for inactive buffer
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
  color = { bg = colors.bg_highlight, fg = colors.cyan, gui = "italic,bold" },
}

local status_mode = {
  function()
    return require("noice").api.status.mode.get()
  end,
  cond = function()
    return package.loaded["noice"] and require("noice").api.status.mode.has()
  end,
  separator = { left = "" },
  color = { bg = colors.bg_highlight, fg = colors.cyan, gui = "italic,bold" },
}

local dap = {
  function()
    return "  " .. require("dap").status()
  end,
  cond = function()
    return package.loaded["dap"] and require("dap").status() ~= ""
  end,
  color = Util.fg("Debug"),
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
