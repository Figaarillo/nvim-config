vim.g.lazyvim_picker = "fzf"

return {
  "ibhagwan/fzf-lua",
  keys = {
    {
      "<C-p>",
      function() require("fzf-lua").buffers() end,
      desc = "Buffers",
    },
    {
      "<leader>fp",
      function() require("oil").open() end,
      desc = "File Explorer",
    },
  },
  opts = {
    winopts = {
      height = 0.85,
      width = 0.80,
      preview = { layout = "horizontal" },
    },
    keymap = {
      fzf = {
        ["ctrl-j"] = "down",
        ["ctrl-k"] = "up",
        ["ctrl-q"] = "select-all+accept",
      },
    },
  },
}
