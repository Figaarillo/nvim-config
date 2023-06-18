-- ==================================================================
--                             VIM CONFIG
-- ==================================================================

-- ============================== Alias =============================
local set = vim.opt -- global/buffer/window-scoped options

-- ========================== Basic config ==========================
set.clipboard = "unnamedplus" -- allows to use the OS clipboard
set.cursorline = true -- highlight the current line
set.encoding = "utf-8" -- enables international characters
set.hidden = true -- allows switch between buffers and not closing them
set.ignorecase = true -- ignore case letters when search a word
set.mouse = "a" -- allows use the mouse
set.scrolloff = 10 -- keep at least 8 lines below cursor
set.showcmd = true -- show the commands
set.showmatch = true -- highlight matching parentheses
set.smartcase = false -- ignore lower case for the wholef pattern
set.spelllang = "en,es" -- correct the words using Spanish and English dictionary
set.splitbelow = true -- set the splits to open at the below
set.splitright = true -- set the splits to open at the right side
set.title = true -- show the file name
set.laststatus = 3 -- set when show the statusline [3: always ans only the last window]
set.shell = "/bin/zsh" -- set zsh as default terminal
set.emoji = true
set.lazyredraw = true -- do not redraw while executing macros (improve performance)
set.mousemoveevent = true
set.showtabline = 0

-- ======================= Side number config =======================
set.number = true -- show line number
set.relativenumber = true -- shows numbers relative to our position
set.numberwidth = 3 -- change width of the column
set.signcolumn = "yes"

-- ========================== Tabs & Indent =========================
set.tabstop = 2 -- chnage the display widht of the tabs characters, not the behavior of pressing tab
set.shiftwidth = 2 -- change the number of space characters inserted for indentation
set.expandtab = true -- insert space characters instead of tab
set.autoindent = true -- keep the tab of the previous line
set.linebreak = true -- wrap on word boundary
set.smartindent = true
set.wrap = false

-- ====================== Color schemes config ======================
set.termguicolors = true -- turn on true color in terminal
set.syntax = "enable" -- show the syntax
set.background = "dark"

-- ============================= Neovide ============================
---@diagnostic disable: undefined-global
vim.cmd([[
	if exists("g:neovide")
		set guifont=Operator\ Mono\ Lig\ Book:h4.1
		" set guifont=Cascadia\ Code:h4
		let g:neovide_scale_factor = 1.0
		let g:neovide_cursor_vfx_mode = "pixiedust"
		let g:neovide_remember_window_size = v:true
    let g:neovide_transparency = 0.85
    let g:neovide_background_color = '#0B0E14'
	endif
]])
