return {
  {
    "Shatur/neovim-ayu",
    priority = 1000, -- Ensure it loads first
    lazy = true,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = true,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false,
      show_end_of_buffer = false, -- show the '~' characters after the end of buffers
      term_colors = false,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = { "italic" },
        keywords = { "bold" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    },
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      italic_comments = true,
      hide_fillchars = true,
      borderless_telescope = true,
      terminal_colors = true,
    },
  },
  {
    "Mofiqul/dracula.nvim",
    priority = 1000, -- Ensure it loads first
    lazy = true,
    opts = {
      show_end_of_buffer = true, -- default false
      transparent_bg = false, -- default false
      lualine_bg_color = "#44475a", -- default nil
      italic_comment = true, -- default false
      overrides = {},
    },
  },
  {
    "Everblush/nvim",
    name = "everblush",
    priority = 1000, -- Ensure it loads first
    lazy = true,
    opts = {
      override = {},
      transparent_background = false,
      nvim_tree = {
        contrast = true,
      },
    },
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      compile = false, -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = { italic = true },
      keywordStyle = { bold = true, italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = { -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      -- overrides = function(colors) -- add/modify highlights
      --   return {}
      -- end,
      theme = "wave", -- Load "wave" theme when 'background' option is not set
      background = { -- map the value of 'background' option to a theme
        dark = "wave", -- try "dragon" !
        light = "lotus",
      },
    },
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    lazy = true,
    opts = {
      options = {
        transparency = false,
        bold = true,
        italic = true,
        underline = true,
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
        onedark = {},
        onedark_dark = {
          bg = "#1A1B26",
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
        onedark_vivid = {
          fg = "#abb2bf",
          red = "#F44747",
          orange = "#cd925a",
          yellow = "#e5c07b",
          green = "#74c060",
          cyan = "#2bbac5",
          blue = "#429feb",
          purple = "#a94bb1",
          -- purple = "#ab4eff",
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
  },
  {
    "projekt0n/github-nvim-theme",
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").compile()
    end,
  },
}
