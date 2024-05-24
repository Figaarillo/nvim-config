---@diagnostic disable: undefined-field

local colors = require("oldworld.palette")
local icons = require("lazyvim.config").icons
local Util = require("lazyvim.util").ui

local modecolor = {
  n = colors.red,
  i = colors.cyan,
  v = colors.purple,
  [""] = colors.purple,
  V = colors.red,
  c = colors.yellow,
  no = colors.red,
  s = colors.yellow,
  S = colors.yellow,
  [""] = colors.yellow,
  ic = colors.yellow,
  R = colors.green,
  Rv = colors.purple,
  cv = colors.red,
  ce = colors.red,
  r = colors.cyan,
  rm = colors.cyan,
  ["r?"] = colors.cyan,
  ["!"] = colors.red,
  t = colors.bright_red,
}

local theme = {
  normal = {
    a = { fg = colors.bg_dark, bg = colors.blue },
    b = { fg = colors.blue, bg = colors.white },
    c = { fg = colors.white, bg = colors.bg_dark },
    z = { fg = colors.white, bg = colors.bg_dark },
  },
  insert = { a = { fg = colors.bg_dark, bg = colors.orange } },
  visual = { a = { fg = colors.bg_dark, bg = colors.green } },
  replace = { a = { fg = colors.bg_dark, bg = colors.green } },
}

local mode = {
  "mode",
  separator = { left = "", right = "" },
  color = function()
    local mode_color = modecolor
    return { bg = mode_color[vim.fn.mode()], fg = colors.bg_dark, gui = "bold" }
  end,
}

local space = {
  function()
    return " "
  end,
  color = { bg = colors.bg_dark, fg = colors.blue },
}

local diff = {
  "diff",
  color = { bg = colors.gray2, fg = colors.bg, gui = "bold" },
  separator = { left = "", right = "" },
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
  color = { bg = colors.gray2, fg = colors.blue, gui = "bold" },
  separator = { left = "" },
  symbols = {
    error = icons.diagnostics.Error,
    warn = icons.diagnostics.Warn,
    info = icons.diagnostics.Info,
    hint = icons.diagnostics.Hint,
  },
  diagnostics_color = {
    error = { fg = colors.red },
    warn = { fg = colors.yellow },
    info = { fg = colors.purple },
    hint = { fg = colors.cyan },
  },
}

local buffers = {
  "buffers",
  separator = { left = "", right = "" },
  color = { bg = colors.bg, fg = colors.purple, gui = "bold" },
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
    inactive = { bg = colors.black, fg = colors.fg_gutter }, -- color for inactive buffer
  },
  symbols = {
    modified = " ●",
    alternate_file = "",
    directory = "",
  },
}

local command = {
  function()
    return require("noice").api.status.command.get()
  end,
  cond = function()
    return package.loaded["noice"] and require("noice").api.status.command.has()
  end,
  color = { fg = colors.red, bg = colors.bg_dark, gui = "italic,bold" },
}

local status_mode = {
  function()
    return require("noice").api.status.mode.get()
  end,
  cond = function()
    return package.loaded["noice"] and require("noice").api.status.mode.has()
  end,
  color = { fg = colors.red, bg = colors.bg_dark, gui = "italic,bold" },
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
  color = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
  separator = { left = "", right = "" },
  function()
    return " " .. os.date("%R")
  end,
}

return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    priority = 1000,
    opts = function()
      return {
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
          lualine_z = { space, clock },
        },
        extensions = { "neo-tree", "lazy" },
      }
    end,
  },
}
