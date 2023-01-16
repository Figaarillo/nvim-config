-- ========================= Alias ========================
local map = vim.keymap.set
local options = { noremap = true, silent = true }
local g = vim.g -- global variables

-- ========================================================
--                        KEY MAPPING
-- ========================================================

-- ====================== Leader key ======================
g.mapleader = " "

-- ================== Without leader key ==================
map("n", "<C-s>", ":w<CR>", options) -- to save in normal mode
map("n", "<C-M-s>", ":w<CR><Esc>:Prettier<CR><Esc>", options) -- format save
map("i", "<C-s>", "<Esc>:w<CR>a", options) -- to save in insert mode
map("i", "<C-M-s>", "<Esc>:w ", options) -- named save
-- map("n", "C-a", ":tabedit .<CR>", options) -- open a file explorer
map("n", "qqq", ":q!<CR>", options) -- fast close
map("n", "qq", ":Alpha<CR>", options) -- fast close
map("n", "<M-z>", "<cmd>set wrap!<CR>", options)
map("n", "<C-n>", ":tabnew ", options)
map("i", "<C-BS>", "<C-W>", {}) -- Ctrl-Backspace to delete the previous word
map("v", "<", "<gv", options)
map("v", ">", ">gv", options)
map("n", "ss", ":split<Return><C-w>w", options)
map("n", "sv", ":vsplit<Return><C-w>w", options)

-- =================== resize the buffer ==================
map("n", "<C-right>", ":vertical resize -5<CR>", options)
map("n", "<C-left>", ":vertical resize +5<CR>", options)
map("n", "<C-up>", ":resize -5<CR>", options)
map("n", "<C-down>", ":resize +5<CR>", options)

-- ============= Moving within the insert mode ============
map("i", "<C-h>", "<left>", options)
map("i", "<C-j>", "<down>", options)
map("i", "<C-k>", "<up>", options)
map("i", "<C-l>", "<right>", options)

-- ================= Move between buffers =================
map("n", "<Tab>", ":bnext<CR>")
map("n", "<s-TAB>", ":bprevious<CR>")
map("", "<C-j>", "<C-W>j", options)
map("", "<C-k>", "<C-W>k", options)
map("", "<C-h>", "<C-W>h", options)
map("", "<C-l>", "<C-W>l", options)

-- ================ Move text up and down =================
map("v", "<M-j>", ":m '>+1<CR>gv=gv", options)
map("v", "<M-k>", ":m '<-2<CR>gv=gv", options)
map("n", "<M-k>", ":m .-2<CR>==", {})
map("n", "<M-j>", ":m .+1<CR>==", {})

-- ==================== With leader key ===================
map("n", "<leader>w", ":bdelete!<CR>", options) -- to close current buffer
map("n", "<leader>s", ":ASToggle<CR>", {}) -- toggle autosave
map("n", "<leader>h", ":set hlsearch!<CR>", {})
map("n", "<leader>pp", ":PackerSync<CR>", options)
map("", "<leader>ff", ":Prettier<CR>", options)

-- ======================= Nvim Tree ======================
map("n", "<C-M-j>", ":NvimTreeToggle<CR>", {})

-- ===================== Open terminal ====================
map("n", "<leader>'", '<Cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>', options) -- to open and split a new terminal
map("n", "<leader>t", '<Cmd>exe v:count1 . "ToggleTerm direction=float"<CR>', options) -- to open and split a new terminal
map("t", "<esc>", [[<C-\><C-n>]], options)

-- ======================= Telescope ======================
map(
	"n",
	"<C-p>",
	'<cmd>lua require"telescope.builtin".buffers(require("telescope.themes").get_dropdown({previewer = false}))<CR>',
	options
)

map(
	"n",
	"<C-M-p>",
	'<cmd>lua require"telescope.builtin".find_files(require("telescope.themes").get_dropdown({}))<CR>',
	options
)
map(
	"n",
	"<C-M-i>",
	'<cmd>lua require"telescope.builtin".grep_string(require("telescope.themes").get_cursor({}))<CR>',
	options
)
map(
	"n",
	"<C-M-t>",

	'<cmd>lua require"telescope.builtin".colorscheme(require("telescope.themes").get_dropdown({winblend = 10}))<CR>',
	options
)
map("n", "<C-M-k>", "<cmd>Telescope keymaps<CR>", options)

map("n", "<C-M-o>", "<cmd>Telescope oldfiles<CR>", options)

-- ========================= Comment ========================
local api = require("Comment.api")
local keymap = vim.keymap.set

-- Toggle current line (linewise) using C-/
keymap("n", "<C-/>", api.toggle.linewise.current)
keymap("x", "<C-/>", api.toggle.linewise.current)

-- Toggle current line (blockwise) using C-\
keymap("n", "<C-\\>", api.toggle.blockwise.current)
keymap("x", "<C-\\>", api.toggle.blockwise.current)

-- ========================== REST ==========================
map("n", "<leader>rr", "<Plug>RestNvim", {}) -- run the request under the cursor
