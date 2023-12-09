return {
  "xiyaowong/nvim-transparent",
  evetn = "VeryLazy",
  opts = {
    extra_groups = {
      "nvterm",
      "lualine",
      "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
    },
    clear_prefix = { "lualine,", "nvterm" },
  },
  keys = {
    {
      "<leader>uet",
      function()
        require("transparent").toggle()
      end,
      desc = "Toggle transparent",
    },
  },
  config = function()
    vim.g.transparent_enbled = 1
  end,
}
