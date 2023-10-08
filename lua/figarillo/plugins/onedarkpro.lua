return {
  "olimorris/onedarkpro.nvim",
  priority = 1000, -- Ensure it loads first
  opts = {
    options = {
      transparency = false,
      bold = true,
      italic = true,
      underline = false,
      undercurl = true,
    },
    styles = {
      types = "NONE",
      numbers = "NONE",
      strings = "NONE",
      comments = "italic",
      keywords = "bold",
      constants = "bold,italic",
      functions = "italic",
      operators = "NONE",
      variables = "NONE",
      conditionals = "italic",
      virtual_text = "NONE",
    },
    filetypes = {
      all = false,
      markdown = true,
      ruby = true,
    },
    highlights = {
      -- Comment = { link = "Substitute" },
    },
    colors = {
      onedark = {
        bg = "#0B0E14",
        fg = "#abb2bf",
        red = "#F44747",
        orange = "#cd925a",
        yellow = "#e5c07b",
        green = "#74c060",
        cyan = "#2bbac5",
        blue = "#429feb",
        purple = "#a94bb1",
        white = "#abb2bf",
        black = "#282C34",
        gray = "#434852",
        highlight = "#e2be7d",
        comment = "#7f848e",
        none = "NONE",
      },
      onedark_dark = {
        fg = "#abb2bf",
        red = "#F44747",
        orange = "#cd925a",
        yellow = "#e5c07b",
        green = "#74c060",
        cyan = "#2bbac5",
        blue = "#429feb",
        purple = "#a94bb1",
        white = "#abb2bf",
        black = "#282C34",
        gray = "#434852",
        highlight = "#e2be7d",
        comment = "#7f848e",
        none = "NONE",
      },
      telescope_prompt = "#282C34",
      telescope_results = "#000000",
      hlgroups = {
        TelescopeBorder = {
          fg = "${telescope_results}",
          bg = "${telescope_results}",
        },
        TelescopePromptBorder = {
          fg = "${telescope_prompt}",
          bg = "${telescope_prompt}",
        },
        TelescopePromptCounter = { fg = "${fg}" },
        TelescopePromptNormal = { fg = "${fg}", bg = "${telescope_prompt}" },
        TelescopePromptPrefix = {
          fg = "${purple}",
          bg = "${telescope_prompt}",
        },
        TelescopePromptTitle = {
          fg = "${telescope_prompt}",
          bg = "${purple}",
        },

        TelescopePreviewTitle = {
          fg = "${telescope_results}",
          bg = "${green}",
        },
        TelescopeResultsTitle = {
          fg = "${telescope_results}",
          bg = "${telescope_results}",
        },

        TelescopeMatching = { fg = "${purple}" },
        TelescopeNormal = { bg = "${telescope_results}" },
        TelescopeSelection = { bg = "${telescope_prompt}" },
      },
    },
  },
}