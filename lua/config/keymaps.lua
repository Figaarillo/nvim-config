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
keymap("i", "<C-BS>", "<C-W>", { desc = "Delete backword" }) -- Ctrl-Backspace to delete the previous word
keymap("n", "<C-c>", "<cmd>bd<CR>", { desc = "Delete Buffer and Window" }) -- Ctrl-c to close buffer

-- =========================== Indent line ==========================
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- ========================== Split window ==========================
keymap("n", "ss", "<cmd>split<Return><C-w>w", opts)
keymap("n", "sv", "<cmd>vsplit<Return><C-w>w", opts)

-- ======================= Increment/Decrement=======================
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)

-- ========================= Better up/down =========================
keymap({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
keymap({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- ======================== Resize the buffer =======================
keymap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- ================== Moving within the insert mode =================
keymap("i", "<C-h>", "<left>", opts)
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
keymap("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
keymap("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

-- =========================== Move Lines ===========================
keymap("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
keymap("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
keymap("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
keymap("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- ======================= Toggle sign column =======================
keymap("n", "<leader>ua", "<cmd>set signcolumn=no<CR>", { desc = "Hide sign column" })
keymap("n", "<leader>uA", "<cmd>set signcolumn=number<CR>", { desc = "Show sign column" })

-- ======================== Multiple cursors ========================
keymap("n", "<leader>k", "*``cgN", { desc = "Find previous occurrence" })
keymap("n", "<leader>j", "*``cgn", { desc = "Find next occurrence" })
