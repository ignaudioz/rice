" auto-install vim-plug
if empty(glob('$XDG_CONFIG_HOME/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('$XDG_CONFIG_HOME/nvim/autoload/plugged')

  " File explorer
  Plug 'scrooloose/NERDTree' 
   
  " Theming
  Plug 'itchyny/lightline.vim' " Status line
  Plug 'ryanoasis/vim-devicons' " Icons for File-exp
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Treesitter

  " I prefer coc much over naitive lsp since it's more simple
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }  
  Plug 'honza/vim-snippets' " Snippets 

  " Comments
  Plug 'tpope/vim-commentary'
  " Fzf
  Plug 'junegunn/fzf.vim'
  
call plug#end()


" Plugin config

so $XDG_CONFIG_HOME/nvim/plug-config/themer.vim
so $XDG_CONFIG_HOME/nvim/plug-config/coc.vim
so $XDG_CONFIG_HOME/nvim/plug-config/fzf.vim
so $XDG_CONFIG_HOME/nvim/plug-config/nerdtree.vim
