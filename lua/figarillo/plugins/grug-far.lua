return {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
  keys = {
    {
      "<leader>sr",
      function() require("grug-far").open() end,
      desc = "Search and Replace (grug-far)",
    },
    {
      "<leader>sw",
      function()
        require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
      end,
      desc = "Search current word",
    },
  },
  opts = {
    headerMaxWidth = 80,
  },
}
