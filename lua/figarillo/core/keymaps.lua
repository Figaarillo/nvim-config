-- ==================================================================
--                            KEY MAPPING
-- ==================================================================

-- ============================== Alias =============================
local map = vim.keymap.set
local options = { noremap = true, silent = true }
local g = vim.g -- global variables

-- =========================== Leader key ===========================
g.mapleader = " "

-- ======================= Without leader key =======================
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

-- ========================= With leader key ========================
map("n", "<leader>w", ":bdelete!<CR>", options) -- to close current buffer
map("n", "<leader>s", ":ASToggle<CR>", {}) -- toggle autosave
map("n", "<leader>h", ":set hlsearch!<CR>", {})
map("n", "<leader>pp", ":PackerSync<CR>", options)
map("", "<leader>ff", ":Prettier<CR>", options)

-- ======================== Resize the buffer =======================
map("n", "<C-right>", ":vertical resize -5<CR>", options)
map("n", "<C-left>", ":vertical resize +5<CR>", options)
map("n", "<C-up>", ":resize -5<CR>", options)
map("n", "<C-down>", ":resize +5<CR>", options)

-- ================== Moving within the insert mode =================
map("i", "<C-h>", "<left>", options)
map("i", "<C-j>", "<down>", options)
map("i", "<C-k>", "<up>", options)
map("i", "<C-l>", "<right>", options)

-- ====================== Move between buffers ======================
map("n", "<Tab>", ":bnext<CR>")
map("n", "<s-TAB>", ":bprevious<CR>")
map("", "<C-j>", "<C-W>j", options)
map("", "<C-k>", "<C-W>k", options)
map("", "<C-h>", "<C-W>h", options)
map("", "<C-l>", "<C-W>l", options)

-- ====================== Move text up and down =====================
map("v", "<M-j>", ":m '>+1<CR>gv=gv", options)
map("v", "<M-k>", ":m '<-2<CR>gv=gv", options)
map("n", "<M-k>", ":m .-2<CR>==", {})
map("n", "<M-j>", ":m .+1<CR>==", {})

-- ============================ Nvim Tree ===========================
map("n", "<C-M-j>", ":NvimTreeToggle<CR>", {})

-- ========================== Open terminal =========================
map("n", "<leader>'", '<Cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>', options) -- to open and split a new terminal
map("n", "<leader>t", '<Cmd>exe v:count1 . "ToggleTerm direction=float"<CR>', options) -- to open and split a new terminal
map("t", "<esc>", [[<C-\><C-n>]], options)

-- ============================ Telescope ===========================
-- Find open buffers
map(
	"n",
	"<C-p>",
	'<cmd>lua require"telescope.builtin".buffers(require("telescope.themes").get_dropdown({previewer = false}))<CR>',
	options
)

-- Find files
map(
	"n",
	"<C-M-p>",
	'<cmd>lua require"telescope.builtin".find_files(require("telescope.themes").get_dropdown({}))<CR>',
	options
)

-- Search and set colorscheme
map(
	"n",
	"<C-M-t>",
	'<cmd>lua require"telescope.builtin".colorscheme(require("telescope.themes").get_dropdown({winblend = 10}))<CR>',
	options
)

-- Find old fiels
map("n", "<leader>?", require("telescope.builtin").oldfiles, options)

-- Find helps
map("n", "<C-M-o>", require("telescope.builtin").help_tags)

-- Find keymaps
map("n", "<C-M-k>", "<cmd>Telescope keymaps<CR>", options)

-- ============================= Comment ============================
local api = require("Comment.api")

-- Toggle current line (linewise) using C-/
map("n", "<C-/>", api.toggle.linewise.current)
map("x", "<C-/>", api.toggle.linewise.current)

-- Toggle current line (blockwise) using C-\
map("n", "<C-\\>", api.toggle.blockwise.current)
map("x", "<C-\\>", api.toggle.blockwise.current)

-- ============================== REST ==============================
map("n", "<leader>rr", "<Plug>RestNvim", {}) -- run the request under the cursor

-- ============================ LSP Saga ============================
local opts = { noremap = true, silent = true }

-- Hover Doc
map("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)

map("n", "gp", "<Cmd>Lspsaga preview_definition<CR>", opts)

map("i", "<leader>hl", "<Cmd>Lspsaga signature_help<CR>", opts)

-- Rename
map("n", "gr", "<cmd>Lspsaga rename<CR>")

-- Go to Definition
map("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

-- show_line_diagnsotic float window unfocus
map("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Show cursor diagnostic
map("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Show buffer diagnostic
map("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Diagnsotic jump
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Diagnostic jump with filter like Only jump to error
map("n", "[E", function()
	require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
map("n", "]E", function()
	require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

-- Code action
map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

-- Toggle Outline
map("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

-- ========================== Todo comments =========================
map("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

map("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
