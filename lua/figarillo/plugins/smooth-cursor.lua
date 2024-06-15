return {
  "gen740/SmoothCursor.nvim",
  event = { "LazyFile", "BufReadPost" },
  config = function()
    require("smoothcursor").setup({
      type = "exp",
      fancy = {
        enable = true,
      },
    })
  end,
}
