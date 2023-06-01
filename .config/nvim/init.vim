" Sets
set encoding=utf-8
syntax off
filetype plugin on 

" Number related
set number
set relativenumber

" Splits
set splitbelow splitright   " how to split new windows.

" Tab related
set tabstop=4
set showtabline=2
set shiftwidth=2
set signcolumn=yes
set smarttab expandtab smartindent

set nowrap " No text wraping
set laststatus=2 " Enable tabs
set clipboard^=unnamed,unnamedplus " Share clipboards registers
set mouse=a " Enables mouse
set noshowmode " Disables '-- INSERT --'

" Set path include subfolders aswell
set path+=**
set wildmenu

" Sudo write
command! MakeWrite :w !sudo tee % 

" Create 'tags' will be used mostly for toml filetypes.
command! MakeTags !ctags -R .

" Mapleader
let mapleader = " "

nnoremap gf :e <cfile><CR>
nnoremap <leader>b  :Buffers<CR>
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>

" Vim plug
so $XDG_CONFIG_HOME/nvim/vim-plug/plugins.vim
