return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  optional = true,
  opts = {
    defaults = {
      ["<leader>a"] = { name = "+autosave" },
      ["<leader>o"] = { name = "+oil" },
      ["<leader>t"] = { name = "+terminal" },
      ["<leader>cc"] = { name = "+codeium" },
      ["<leader>ue"] = { name = "+extra" },
    },
  },
}
