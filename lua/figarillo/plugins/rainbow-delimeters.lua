return {
  "HiPhish/rainbow-delimiters.nvim",
  config = function()
    -- This module contains a number of default definitions
    local rainbow_delimiters = require("rainbow-delimiters")

    local cmd = vim.cmd

    -- cmd([[highlight RainbowDelimiterRed guifg=#8c1eff ctermfg=White]])
    -- cmd([[highlight RainbowDelimiterYellow guifg=#f222ff ctermfg=White]])
    -- cmd([[highlight RainbowDelimiterBlue guifg=#ff2975 ctermfg=White]])
    -- cmd([[highlight RainbowDelimiterOrange guifg=#ff901f ctermfg=White]])
    -- cmd([[highlight RainbowDelimiterGreen guifg=#ffd319 ctermfg=White]])
    -- cmd([[highlight RainbowDelimiterViolet guifg=#ff2975 ctermfg=White]])
    -- cmd([[highlight RainbowDelimiterCyan guifg=#f222ff ctermfg=White]])

    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = rainbow_delimiters.strategy["global"],
        vim = rainbow_delimiters.strategy["local"],
      },
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
      },
      highlight = {
        -- "RainbowDelimiterRed",
        -- "RainbowDelimiterYellow",
        -- "RainbowDelimiterBlue",
        -- "RainbowDelimiterOrange",
        -- "RainbowDelimiterGreen",
        -- "RainbowDelimiterViolet",
        -- "RainbowDelimiterCyan",
      },
    }
  end,
}
