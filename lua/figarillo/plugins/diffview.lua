return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewToggleFiles" },
  keys = {
    { "<leader>gv", "<cmd>DiffviewOpen<cr>", desc = "Diffview (working tree)" },
    { "<leader>gH", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview file history" },
    { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Diffview close" },
  },
  opts = {
    enhanced_diff_hl = true,
  },
}
