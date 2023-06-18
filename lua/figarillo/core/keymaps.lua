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
keymap("n", "<C-s>", ":w<CR>", options) -- to save in normal mode
keymap("i", "<C-s>", "<Esc>:w<CR>a", options) -- to save in insert mode
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

-- ========================= With leader key ========================
keymap("n", "<leader>w", ":bdelete!<CR>", options) -- to close current buffer
keymap("n", "<leader>s", ":ASToggle<CR>", {}) -- toggle autosave
keymap("n", "<leader>h", ":set hlsearch!<CR>", {}) -- toggle highlight search
keymap("n", "<leader>pp", ":PackerSync<CR>", options)
keymap("n", "<leader>ff", ":Format<CR>", options)

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
keymap("n", "<Tab>", ":bnext<CR>")
keymap("n", "<s-TAB>", ":bprevious<CR>")
keymap("", "<C-j>", "<C-W>j", options)
keymap("", "<C-k>", "<C-W>k", options)
keymap("", "<C-h>", "<C-W>h", options)
keymap("", "<C-l>", "<C-W>l", options)

-- ====================== Move text up and down =====================
keymap("v", "<M-j>", ":m '>+1<CR>gv=gv", options)
keymap("v", "<M-k>", ":m '<-2<CR>gv=gv", options)
keymap("n", "<M-k>", ":m .-2<CR>==", {})
keymap("n", "<M-j>", ":m .+1<CR>==", {})

