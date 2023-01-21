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
keymap("", "<leader>ff", ":Format<CR>", options)

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

-- ============================ Nvim Tree ===========================
keymap("n", "<C-M-j>", ":NvimTreeToggle<CR>", options)
keymap("n", "<leader>e", ":NvimTreeOpen<CR>", options)

-- ========================== Open terminal =========================
keymap("n", "<leader>'", '<Cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>', options) -- to open and split a new terminal
keymap("n", "<leader>t", '<Cmd>exe v:count1 . "ToggleTerm direction=float"<CR>', options) -- to open and split a new terminal
keymap("t", "<esc>", [[<C-\><C-n>]], options)

-- ============================ Telescope ===========================
-- Find open buffers
keymap(
	"n",
	"<C-p>",
	'<cmd>lua require"telescope.builtin".buffers(require("telescope.themes").get_dropdown({previewer = false}))<CR>',
	options
)

-- Find files
keymap(
	"n",
	"<C-M-p>",
	'<cmd>lua require"telescope.builtin".find_files(require("telescope.themes").get_dropdown({}))<CR>',
	options
)

-- Search and set colorscheme
keymap(
	"n",
	"<C-M-t>",
	'<cmd>lua require"telescope.builtin".colorscheme(require("telescope.themes").get_dropdown({winblend = 10}))<CR>',
	options
)

-- Find old fiels
keymap("n", "<leader>?", require("telescope.builtin").oldfiles, options)

-- Find helps
keymap("n", "<C-M-o>", require("telescope.builtin").help_tags)

-- Find keymaps
keymap("n", "<C-M-k>", "<cmd>Telescope keymaps<CR>", options)

-- ============================= Comment ============================
local api = require("Comment.api")

-- Toggle current line (linewise) using C-/
keymap("i", "<C-/>", api.toggle.linewise.current)

-- Toggle current line (blockwise) using C-\
keymap("i", "<C-\\>", api.toggle.blockwise.current)

-- ============================== REST ==============================
keymap("n", "<leader>rr", "<Plug>RestNvim", {}) -- run the request under the cursor

-- ============================ LSP Saga ============================
-- Hover Doc
keymap("n", "K", "<Cmd>Lspsaga hover_doc<CR>")

-- Peak definition
keymap("n", "gP", "<cmd>Lspsaga peek_definition<CR>")

-- preview definition
keymap("n", "gp", "<Cmd>Lspsaga preview_definition<CR>")

keymap("i", "<leader>hl", "<Cmd>Lspsaga signature_help<CR>")

-- Rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>")

-- Go to Definition
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

-- show_line_diagnsotic float window unfocus
keymap("n", "<leader>gl", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Show cursor diagnostic
keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Show buffer diagnostic
keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Code action
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

-- Toggle Outline
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

-- ============================= Trouble ===========================
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })
