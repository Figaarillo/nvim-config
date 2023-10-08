-- ==================================================================
--                            KEY MAPPING
-- ==================================================================

-- ============================== Alias =============================
local keymap = vim.keymap.set
local options = { noremap = true, silent = true }
local g = vim.g -- global variables

-- =========================== Leader key ===========================
g.mapleader = " "

-- ======================= Without leader key =======================
keymap({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" }) -- to save
keymap("i", "<C-M-s>", "<Esc>:w ", options) -- named save
keymap("n", "ZZZ", ":q!<CR>", options) -- fast close
keymap("n", "ZZ", ":Alpha<CR>", options) -- fast close
keymap("n", "<M-z>", "<cmd>set wrap!<CR>", options) -- toggle wrap
keymap("n", "<C-n>", ":tabnew ", options) -- open new tab
keymap("i", "<C-BS>", "<C-W>", {}) -- Ctrl-Backspace to delete the previous word
keymap("v", ">", ">gv", options) -- indent in inser mode
keymap("v", "<", "<gv", options)
keymap("n", "ss", ":split<Return><C-w>w", options)
keymap("n", "sv", ":vsplit<Return><C-w>w", options)

-- ====================== Move line up and down =====================
keymap({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- ======================== Resize the buffer =======================
keymap("n", "<C-right>", ":vertical resize -5<CR>", options)
keymap("n", "<C-left>", ":vertical resize +5<CR>", options)
keymap("n", "<C-up>", ":resize -5<CR>", options)
keymap("n", "<C-down>", ":resize +5<CR>", options)

-- ================== Moving within the insert mode =================
keymap("i", "<C-h>", "<left>", options)
keymap("i", "<C-j>", "<down>", options)
keymap("i", "<C-k>", "<up>", options)
keymap("i", "<C-l>", "<right>", options)

-- ====================== Move between buffers ======================
keymap("n", "<Tab>", "<cmd>bnext<CR>")
keymap("n", "<s-TAB>", "<cmd>bprevious<CR>")
keymap("", "<C-j>", "<C-W>j", options)
keymap("", "<C-k>", "<C-W>k", options)
keymap("", "<C-h>", "<C-W>h", options)
keymap("", "<C-l>", "<C-W>l", options)

-- ====================== Move text up and down =====================
keymap("v", "<M-j>", ":m '>+1<CR>gv=gv", options)
keymap("v", "<M-k>", ":m '<-2<CR>gv=gv", options)
keymap("n", "<M-k>", ":m .-2<CR>==", {})
keymap("n", "<M-j>", ":m .+1<CR>==", {})

-- =========================== Sign column ==========================
keymap("n", "<leader>ua", "<cmd>set signcolumn=no<CR>", { desc = "Hide sign column" })
keymap("n", "<leader>uA", "<cmd>set signcolumn=number<CR>", { desc = "Show sign column" })
