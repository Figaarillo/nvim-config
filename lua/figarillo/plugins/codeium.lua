return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  config = function()
    local neocodeium = require("neocodeium")
    local key = vim.keymap.set

    neocodeium.setup()
    key("i", "<Tab>", neocodeium.accept)
    key("i", "<A-.>", neocodeium.accept)
    key("i", "<A-w>", neocodeium.accept_word)
    key("i", "<A-a>", neocodeium.accept_line)
    key("i", "<A-[>", function()
      require("neocodeium").cycle_or_complete(-1)
    end)
    key("i", "<A-]>", neocodeium.cycle_or_complete)
    key("i", "<A-c>", neocodeium.clear)
  end,
  keys = {
    {
      "<leader>ccd",
      "<cmd>CodeiumDisable<CR>",
      desc = "Disable codeium",
    },
    {
      "<leader>cce",
      "<cmd>CodeiumEnable<CR>",
      desc = "Enable codeium",
    },
  },
}
