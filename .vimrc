" Behaviour
set nocompatible 			" make vim iMproved
set clipboard=unnamedplus		" use + clipboard by default

set mouse=a 				" allow mouse in all modes
set backspace=indent,eol,start 		" allow backspace to do everything

set wildmenu
set wildmode=longest,list

set undofile 				" persistent history
set undodir=~/.vim/undo			" undo history location
set directory=~/.vim/swap		" swap files location
set backupdir=~/.vim/backup		" backup files location

set encoding=utf8

" Formatting
set autoindent
set noexpandtab
set tabstop=8
set shiftwidth=8
set linebreak

" Interface
set laststatus=2
set ttimeoutlen=10
set t_Co=256
set colorcolumn=80
set number

" Force vim to recognize .h files as C headers
augroup project
	autocmd!
	autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END

" LaTeX specific settings:
augroup LaTeX_settings
	autocmd!
	autocmd FileType tex set colorcolumn=110
	autocmd FileType tex set spelllang=ru,en
	autocmd FileType tex set spell
	autocmd FileType tex set tabstop=4
	autocmd FileType tex set shiftwidth=4
	autocmd FileType tex set breakindent
augroup end

" =======
" Plugins
" =======
call plug#begin('~/.vim/plugged')

	Plug 'kana/vim-submode'

	Plug 'vim-airline/vim-airline'

	Plug 'xolox/vim-misc'
	Plug 'xolox/vim-colorscheme-switcher'

	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'

	Plug 'JamshedVesuna/vim-markdown-preview'

	Plug 'valloric/youcompleteme'
	Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

	Plug 'lervag/vimtex', { 'for': 'tex' }
	Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

call plug#end()

" ============
" Vim Submodes
" ============
call submode#enter_with('splits', 'n', '', '<C-w>')
call submode#leave_with('splits', 'n', '', '<Esc>')
" navigate splits
call submode#map('splits', 'n', '', 'h', '<C-w>h')
call submode#map('splits', 'n', '', 'j', '<C-w>j')
call submode#map('splits', 'n', '', 'k', '<C-w>k')
call submode#map('splits', 'n', '', 'l', '<C-w>l')
" move splits to the edges of the screen
call submode#map('splits', 'n', '', 'H', '<C-w>H')
call submode#map('splits', 'n', '', 'J', '<C-w>J')
call submode#map('splits', 'n', '', 'K', '<C-w>K')
call submode#map('splits', 'n', '', 'L', '<C-w>L')
" grow split wider/thinner
call submode#map('splits', 'n', '', ',', '<C-w><')
call submode#map('splits', 'n', '', '.', '<C-w>>')
" grop split up/down
call submode#map('splits', 'n', '', '=', '<C-w>+')
call submode#map('splits', 'n', '', '-', '<C-w>-')
" rotate splits
call submode#map('splits', 'n', '', 'r', '<C-w>r')
call submode#map('splits', 'n', '', 'R', '<C-w>R')

let g:submode_timeout = 0
let g:submode_always_show_submode = 1

" ============
" Key Bindings
" ============
nnoremap <F2> :NERDTreeToggle<CR>

" ====================
" Vim Airline Settings
" ====================
let g:airline_powerline_fonts=1
let g:airline_theme="base16_default"

" Custom Symbols
if !exists('g:airline_symbols')
	let g:airline_symbols={}
endif

let g:airline_symbols.linenr=''
let g:airline_symbols.maxlinenr=''
let g:airline_symbols.whitespace=''
" Custom right-most part
call airline#parts#define_raw('line', (g:airline_symbols.linenr).' %#__accent_bold#%l/%L%#__restore__#')
let g:airline_section_z=airline#section#create(['line',':%v'])

" Get rid of default mode indicator
set noshowmode

" =========================
" Markdown Preview Settings
" =========================
let vim_markdown_preview_toggle=0
let vim_markdown_preview_github=1
let vim_markdown_preview_use_xdg_open=1

" ======================
" YouCompleteMe Settings
" ======================
let g:ycm_global_ycm_extra_conf= '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_server_python_interpreter='/usr/bin/python'
" Disable preview window
set completeopt-=preview

" ===========
" Colorscheme
" ===========
" Setting dark mode
set background=dark

let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox_edited

" =================================
" Trailing whitespace trim function
" =================================
fun! TrimWhitespace()
	let l:save = winsaveview()
	%s/\s\+$//e
	call winrestview(l:save)
endfun
