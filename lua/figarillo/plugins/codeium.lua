return {
  {
    "Exafunction/codeium.vim",
    event = "InsertEnter",
    -- stylua: ignore
    config = function ()
      vim.g.codeium_disable_bindings = 1
      vim.keymap.set("i", "<Tab>", function () return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set("i", "<A-p>", function () return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set("i", "<A-f>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
      vim.keymap.set("i", "<A-b>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
      vim.keymap.set("i", "<A-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
      vim.keymap.set("i", "<A-s>", function() return vim.fn["codeium#Complete"]() end, { expr = true })
    end,
  },
  {
    "nvim-cmp",
    dependencies = {
      {
        "Exafunction/codeium.nvim",
      },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, 1, { name = "codeium", group_index = 2 })
      opts.sorting = opts.sorting or require("cmp.config.default")().sorting
    end,
  },
}
