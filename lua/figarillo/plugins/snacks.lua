-- Obsidian embeds (![[img.png]]) are resolved by name anywhere in the vault,
-- snacks only looks relative to the note. Fall back to a per-vault basename index.
local vault_index = {}

local function resolve_image(file, src)
  if src:match("^%a+://") then
    return nil
  end
  local relative = vim.fs.joinpath(vim.fs.dirname(file), src)
  if vim.uv.fs_stat(relative) then
    return relative
  end
  local root = vim.fs.root(file, ".obsidian")
  if not root then
    return nil
  end
  if not vault_index[root] then
    local index = {}
    for path, kind in vim.fs.dir(root, {
      depth = math.huge,
      skip = function(dir)
        local name = vim.fs.basename(dir)
        return name ~= "node_modules" and name ~= ".git"
      end,
    }) do
      local name = vim.fs.basename(path)
      if kind == "file" and not index[name] then
        index[name] = vim.fs.joinpath(root, path)
      end
    end
    vault_index[root] = index
  end
  return vault_index[root][vim.fs.basename(src)]
end

return {
  "folke/snacks.nvim",
  init = function()
    -- snacks detects kitty with an async terminal query (1s timeout); images opened
    -- before the answer fall back to floats for the whole session. Detect it up front.
    if vim.env.SNACKS_KITTY then
      return
    end
    local is_kitty = vim.env.TERM == "xterm-kitty" or vim.env.KITTY_WINDOW_ID ~= nil
    if not is_kitty and vim.env.TMUX then
      local term = vim.fn.system({ "tmux", "display-message", "-p", "#{client_termname}" })
      is_kitty = term:find("kitty") ~= nil
    end
    if is_kitty then
      vim.env.SNACKS_KITTY = "1"
    end
  end,
  opts = {
    scratch = { enabled = true },
    gitbrowse = { enabled = true },
    lazygit = { enabled = true },
    image = { enabled = true, resolve = resolve_image },
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
