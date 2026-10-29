return {
  "folke/snacks.nvim",
  opts = {
    scratch = { enabled = true },
    gitbrowse = { enabled = true },
    lazygit = { enabled = true },
    image = { enabled = true },
    toggle = { enabled = true },
    -- treat big files as "bigfile" (no treesitter/LSP/etc.) earlier than the 1.5MB default
    bigfile = { size = 512 * 1024 },
    notifier = {
      top_down = false,
    },
    -- oil keeps handling directory buffers (`nvim .`, `:e src/`)
    explorer = { replace_netrw = false },
    picker = {
      sources = {
        explorer = {
          layout = { layout = { position = "right", width = 25, min_width = 25 } },
        },
      },
    },
    terminal = {
      win = { wo = { signcolumn = "no" } },
    },
  },
  keys = {
    { "<leader>lg", function() Snacks.lazygit() end,   desc = "Lazygit" },
    { "<leader>.",  function() Snacks.scratch() end,   desc = "Scratch Buffer" },

    -- ============================ Explorer ============================
    { "<C-M-j>",    function() Snacks.explorer({ cwd = LazyVim.root() }) end, desc = "Explorer Snacks (root dir)" },
    { "<leader>fe", function() Snacks.explorer({ cwd = vim.uv.cwd() }) end,  desc = "Explorer Snacks (cwd)" },
    { "<leader>e",  "<leader>fe", desc = "Explorer Snacks (cwd)", remap = true },
    { "<leader>E",  "<leader>fE", desc = "Explorer Snacks (cwd)", remap = true },

    -- ============================ Terminal ============================
    -- toggle: one persistent terminal per layout (count keeps them apart)
    { "<A-h>", function() Snacks.terminal.toggle(nil, { count = 1, win = { position = "bottom", height = 0.3 } }) end, mode = { "n", "t" }, desc = "Toggle horizontal terminal" },
    { "<A-v>", function() Snacks.terminal.toggle(nil, { count = 2, win = { position = "right", width = 0.5 } }) end,  mode = { "n", "t" }, desc = "Toggle vertical terminal" },
    { "<A-i>", function() Snacks.terminal.toggle(nil, { count = 3, win = { position = "float", border = "rounded", width = 0.7, height = 0.6 } }) end, mode = { "n", "t" }, desc = "Toggle float terminal" },
    -- new: always opens a fresh terminal
    { "<leader>th", function() Snacks.terminal.open(nil, { win = { position = "bottom", height = 0.3 } }) end, desc = "Open new horizontal terminal" },
    { "<leader>tv", function() Snacks.terminal.open(nil, { win = { position = "right", width = 0.5 } }) end,  desc = "Open new vertical terminal" },
    { "<leader>ti", function() Snacks.terminal.open(nil, { win = { position = "float", border = "rounded", width = 0.7, height = 0.6 } }) end, desc = "Open new float terminal" },
  },
}
