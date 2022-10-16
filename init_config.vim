" ==============================================================
"                          VIM CONFIG
" ==============================================================

" ======================== Basic config ========================
set clipboard=unnamedplus                                       " allows to use the OS clipboard
set cursorline                                                  " highlight the current line
set encoding=utf-8                                              " enables international characters
set hidden                                                      " allows switch between buffers and not closing them
set ignorecase                                                  " ignore case to search a word
set mouse=a                                                     " allows use the mouse
set scrolloff=8                                                 " keep at least 8 lines below cursor 
set showcmd                                                     " show the commands
set showmatch                                                   " show where the parentheses close
set spelllang=en,es                                             " correct the words using Spanish and English dictionary
set splitbelow                                                  " set the splits to open at the right below
set splitright                                                  " set the splits to open at the right side
set title                                                       " show the file name
set laststatus=2                                                " TODO: search a definition
syntax enable

" ===================== Side number config =====================
set number                                                      " add number to the side
set relativenumber                                              " shows numbers relative to our position
set numberwidth=1                                               " change width of the column

" ======================= Indent  config =======================
set tabstop=2                                                   " chnage the display widht of the tabs characters, not the behavior of pressing tab 
set shiftwidth=2                                                " change the number of space characters inserted for indentation
set expandtab                                                   " insert space characters instead of tab
set autoindent                                                  " keep the tab of the previous line
set smartindent
set nowrap

" ==================== Color schemes config ====================
set background=dark
set termguicolors                                               " turn on true color in terminal

" =================== Desable the swap files ===================
set nobackup                                                    " to not create a backup
set noswapfile                                                  " to not create temporary files


" ==============================================================
"                         KEY MAPPING
" ==============================================================

" ===================== Without leader key =====================
nmap <C-s> :w<CR>                                               " to save in normal mode
imap <C-s> <Esc>:w<CR>a                                         " to save in insert mode
noremap <C-a> :tabedit .<CR>                                   " open a file explorer
nmap <F5> :source ~/.config/nvim/init.vim<CR>                   " to update the config file

" ======================= Open terminal ========================
nnoremap <C-t> :split<CR>:ter<CR>:resize 10<CR>                 " to open and split a new terminal
nnoremap <C-A-t> :terminal<CR>                                  " to open a new terminal

" ===================== resize the buffer ======================
nnoremap <silent> <right> :vertical resize +5<CR>
nnoremap <silent> <left> :vertical resize -5<CR>
nnoremap <silent> <up> :resize +5<CR>
nnoremap <silent> <down> :resize -5<CR>

" ==================== Move between buffers ====================
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" ====================== With leader key =======================
let mapleader=";"                                               " leader key
nmap <Leader>w :bdelete!<CR>                                    " to close current buffer
nmap <Leader>d :bprevious<CR>                                   " to move to previus buffer
nmap <Leader>f :bnext<CR>                                       " to move to next buffer
nmap <Leader>t :tabnew<CR>                                      " to open new tab
nmap <Leader>pi :PlugInstall<CR>                                " to install the plugs
nmap <Leader>pu :PlugUpdate<CR>                                 " to update the plugs








