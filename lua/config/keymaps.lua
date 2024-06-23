-- ==================================================================
--                            KEY MAPPING
-- ==================================================================

-- ============================== Alias =============================
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local g = vim.g -- global variables
local nvim_tmux_nav = require("nvim-tmux-navigation")

-- =========================== Leader key ===========================
g.mapleader = " "

-- ======================= Without leader key =======================
keymap({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<CR><esc>", { desc = "Save file" }) -- to save
keymap("n", "ZZZ", ":q!<CR>", opts) -- fast close
keymap("n", "ZZ", "<cmd>Dashboard<CR>", opts) -- fast close
keymap("n", "<M-z>", "<cmd>set wrap!<CR>", opts) -- toggle wrap
keymap("i", "<C-BS>", "<C-W>", { desc = "Delete backward" }) -- Ctrl-Backspace to delete the previous word
-- keymap("n", "<C-a>", "gg<S-v>G", { desc = "Select all" }) -- Ctrl-a to select all
keymap("n", "<C-c>", "<cmd>bd<CR>", { desc = "Close buffer" }) -- Ctrl-c to close buffer

-- =========================== Indent line ==========================
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- ========================== Split window ==========================
keymap("n", "ss", "<cmd>split<Return><C-w>w", opts)
keymap("n", "sv", "<cmd>vsplit<Return><C-w>w", opts)

-- ======================= Increment/Decrement=======================
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)

-- ====================== Move line up and down =====================
keymap({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- ======================== Resize the buffer =======================
keymap("n", "<C-right>", "<C-w><")
keymap("n", "<C-left>", "<C-w>>")
keymap("n", "<C-up>", "<cmd>resize -1<CR>", opts)
keymap("n", "<C-down>", "<cdm>resize +1<CR>", opts)

-- ================== Moving within the insert mode =================
keymap("i", "<C-h>", "<left>", opts)
keymap("n", "-", "<C-x>", opts)
keymap("i", "<C-j>", "<down>", opts)
keymap("i", "<C-k>", "<up>", opts)
keymap("i", "<C-l>", "<right>", opts)

-- ====================== Move between buffers ======================
keymap("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap("n", "<s-TAB>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
keymap("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
keymap("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
keymap("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
keymap("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
-- keymap("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
-- keymap("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

-- ======================= Toggle sign column =======================
keymap("n", "<leader>ua", "<cmd>set signcolumn=no<CR>", { desc = "Hide sign column" })
keymap("n", "<leader>uA", "<cmd>set signcolumn=number<CR>", { desc = "Show sign column" })

-- ======================== Multiple cursors ========================
keymap("n", "<leader>j", "*``cgn", { desc = "Find next occurrence" })
keymap("n", "<leader>k", "*``cgN", { desc = "Find previous occurrence" })
