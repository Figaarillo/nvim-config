-- ============================ Alias ===========================
local map = vim.keymap.set
local options =  { noremap = true, silent = true }
local cmd = vim.cmd

-- ==============================================================
--                         KEY MAPPING
-- ==============================================================

-- ===================== Without leader key =====================
map('n', '<C-s>', ':w<CR>', options)                             -- to save in normal mode
map('i', '<C-s>', '<Esc>:w<CR>a', options)                       -- to save in insert mode
map('n', 'C-a', ':tabedit .<CR>', options)                       -- open a file explorer

-- ======================== Open terminal =======================
-- map('n', 'C-A-t', ':split<CR>:terminal<CR>:resize 10', {})    -- to open and split a new terminal
-- map('n', '<C-A-t>', ':terminal<CR>', options)

-- ====================== resize the buffer =====================
map('n', '<right>', ':vertical resize +5<CR>', options)
map('n', '<left>', ':vertical resize -5<CR>', options)
map('n', '<up>', ':resize +5<CR>', options)
map('n', '<down>', ':resize -5<CR>', options)

-- ================ Moving within the insert mode ===============
map('i', '<C-h>', '<left>', options)
map('i', '<C-j>', '<down>', options)
map('i', '<C-k>', '<up>', options)
map('i', '<C-l>', '<right>', options)

-- ==================== Move between buffers ====================
map('', '<C-j>', '<C-W>j', options)
map('', '<C-k>', '<C-W>k', options)
map('', '<C-h>', '<C-W>h', options)
map('', '<C-l>', '<C-W>l', options)

-- ======================= With leader key ======================
map('n', '<leader>qq', ':q!<CR>', options)                       -- to exit 
map('n', '<leader>w', ':bdelete!<CR>', options)                  -- to close current buffer
map('n', '<leader>d', ':bprevious<CR>', options)                 -- to move to previus buffer
map('n', '<leader>f', ':bnext<CR>', options)                     -- to move to next buffer
map('n', '<leader>t', ':tabnew<CR>', options)                    -- to open new tab
map('n', '<leader>pi', ':PackerInstall<CR>')              -- to install the plugs
map('n', '<leader>pu', ':PackerUpdate<CR>', options)               -- to update the plugs
map('n', '<leader>ev', ':vsplit $MYVIMRC<CR>',{noremap = true})  -- 
