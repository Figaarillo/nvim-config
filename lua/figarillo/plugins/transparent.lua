return {
  "xiyaowong/nvim-transparent",
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
      "<leader>ut",
      function()
        require("transparent").toggle()
      end,
      desc = "Toggle transparent",
    },
    {
      "<leader>ue",
      function()
        require("transparent").enable()
      end,
      desc = "Dissable transparent",
    },
  },
  config = function()
    vim.g.transparent_enbled = 1
  end,
}
