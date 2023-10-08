if true then
  return {}
end

return {
  "marko-cerovac/material.nvim",
  lazy = true,
  priority = 1000, -- Ensure it loads first
  opts = {
    styles = { -- Give comments style such as bold, italic, underline etc.
      comments = { italic = true },
      strings = {},
      keywords = { bold = true, italic = true },
      functions = { italic = true },
      variables = {},
      operators = {},
      types = {},
    },
    lualine_style = "default",
    async_loading = true,
  },
}
