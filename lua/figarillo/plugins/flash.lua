-- <C-Space> in normal mode belongs to tmux navigation (see config/keymaps.lua),
-- so treesitter incremental selection lives on <CR>: <CR> expands, <BS> shrinks
return {
  "folke/flash.nvim",
  keys = {
    {
      "<CR>",
      function()
        require("flash").treesitter({
          actions = {
            ["<CR>"] = "next",
            ["<BS>"] = "prev",
          },
        })
      end,
      mode = { "n", "x", "o" },
      desc = "Treesitter Incremental Selection",
    },
  },
}
