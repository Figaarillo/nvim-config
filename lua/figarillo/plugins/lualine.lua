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

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = "horizon",
      component_separators = "",
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "packer", "NVimTree", "alpha" },
      icons_enabled = true,
      always_divide_middle = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        "branch",
        "diff",
        {
          "diagnostics",
          sources = { "nvim_lsp" },
          sections = { "error", "warn" },
          diagnostics_color = {
            error = { bg = colors.red, fg = colors.white },
            warn = { bg = colors.orange, fg = colors.white },
          },
        },
        { modified, color = { bg = colors.red } },
        {
          "%q",
          cond = function()
            return vim.bo.buftype == "quickfix"
          end,
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
      lualine_y = { { "filetype", colored = true, icon_only = true } },
      lualine_z = { "progress" },
    },
    inactive_sections = {
      lualine_c = { "%f %y %m" },
      lualine_x = {},
    },
  } 
}
