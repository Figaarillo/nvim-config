return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    local icons = require("lazyvim.config").icons
    local colors = {
      red = "#ca1243",
      grey = "#a0a1a7",
      black = "#383a42",
      white = "#f3f3f3",
      light_green = "#83a598",
      orange = "#fe8019",
      green = "#8ec07c",
      bg = "#1A1C23",
    }
    local function modified()
      if vim.bo.modified then
        return "+"
      elseif not vim.bo.modifiable or vim.bo.readonly then
        return "-"
      end
      return ""
    end
    local Util = require("lazyvim.util")

    return {
      options = {
        theme = "horizon",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "packer", "NVimTree", "alpha" } },
        icons_enabled = true,
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          -- "branch",
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
          },
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
        },
        lualine_c = {
          {
            "buffers",
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
            buffers_color = {},
            symbols = {
              modified = " ●",
              alternate_file = "",
              directory = "",
            },
          },
        },
        lualine_x = {},
        lualine_y = {
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = Util.fg("Statement"),
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = Util.fg("Constant"),
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = Util.fg("Debug"),
          },
          { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = Util.fg("Special") },
        },
        lualine_z = {
          function()
            return " " .. os.date("%R")
          end,
        },
      },
      extensions = { "neo-tree", "lazy" },
    }
  end,
}
