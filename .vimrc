" Behaviour
set nocompatible 				" make vim iMproved

set mouse=a 					" allow mouse in all modes
set backspace=indent,eol,start 	" allow backspace to do everything:

set wildmenu					
set wildmode=longest,list

set undofile 					" persistent history
set undodir=~/.vim/undo			" undo history location
set directory=~/.vim/swap		" swap files location
set backupdir=~/.vim/backup		" backup files location

set encoding=utf8

" Formatting
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set linebreak

" Interface
set laststatus=2
set ttimeoutlen=10
set t_Co=256

" Plugins
call plug#begin('~/.vim/plugged')

	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Vim Airline Settings
let g:airline_powerline_fonts = 1
let g:airline_theme="base16_default"
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" Get rid of default mode indicator
set noshowmode

" Colors
set background=dark    			" Setting dark mode
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox_edited

" Copy selection to + register (a-la Ctrl-C)
vnoremap y "+y

" Paste from + clipboard after cursor (a-la Ctrl-V)
nnoremap p "+p

fun! TrimWhitespace()
	let l:save = winsaveview()
	%s/\s\+$//e
	call winrestview(l:save)
endfun
