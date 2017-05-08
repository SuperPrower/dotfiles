set exrc
set secure
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set linebreak
set laststatus=2
set t_Co=256

" Make vim iMproved
set nocompatible

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Vim  Airline Settings
let g:airline_powerline_fonts = 1
let g:airline_theme="base16_default"

" Colors
colorscheme base16-tomorrow-night

" Copy selection to + register (a-la Ctrl-C)
vnoremap y "+y

" Paste from + clipboard after cursor (a-la Ctrl-V)
nnoremap p "+p
