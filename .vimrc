set exrc
set secure
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

" Make vim iMproved
set nocompatible

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/c.vim'
" Plug 'valloric/youcompleteme'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-repeat'
Plug 'othree/html5.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Needed for Airline
set laststatus=2
set t_Co=256

" Copy selection to + register (a-la Ctrl-C)
vnoremap y :yank +<CR>

" Paste from system clipboard after cursor
nnoremap p "+p
