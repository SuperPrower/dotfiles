" Behaviour
set nocompatible 			" make vim iMproved
set clipboard=unnamedplus		" use + clipboard by default

set mouse=a 				" allow mouse in all modes
set backspace=indent,eol,start 		" allow backspace to do everything

set wildmenu
set wildmode=longest,list

filetype plugin indent on

" Set persistent history and undo history/swap/backup files locations
set undofile
set undodir=~/.local/share/nvim/undo
set directory=~/.local/share/nvim/swap
set backupdir=~/.local/share/nvim/backup

set encoding=utf8

" Disable arrow keys lol
noremap <Up> 	:echo "hjkl"<CR>
noremap <Down> 	:echo "hjkl"<CR>
noremap <Left> 	:echo "hjkl"<CR>
noremap <Right>	:echo "hjkl"<CR>

" Formatting
set autoindent
set noexpandtab
set tabstop=8
set shiftwidth=8
set linebreak
set breakindent
set showbreak=..

" Interface
set laststatus=2
set ttimeoutlen=10
set t_Co=256
set colorcolumn=100
set number

" Force vim to recognize .h files as C headers
augroup project
	autocmd!
	autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END


" =======
" Plugins
" =======
call plug#begin("~/.local/share/nvim/plugged")

	" custom submodes
	Plug 'kana/vim-submode'

	" highlighting trailing whitespaces
	Plug 'ntpeters/vim-better-whitespace'

	" cooler statusbar
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" GDB integration
	Plug 'vim-scripts/Conque-GDB'

	" colorscheme fast preview
	Plug 'xolox/vim-misc'
	Plug 'xolox/vim-colorscheme-switcher'

	" file tree
	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'

	" code completion
	" Plug 'valloric/youcompleteme'
	" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
	Plug 'roxma/nvim-completion-manager'
	Plug 'roxma/ncm-clang'		" clang
	Plug 'Shougo/neoinclude.vim'	" include files
	Plug 'Shougo/neco-vim'		" vim configuration
	Plug 'Shougo/neosnippet.vim'	" snippets and function expansion

	" syntax highlighting
	Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }
	Plug 'tmux-plugins/vim-tmux'

	" LaTeX related plugins
	Plug 'lervag/vimtex', { 'for': 'tex' }
	Plug 'donRaphaco/neotex', { 'for': 'tex' }
	" Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

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
nnoremap <F7>  :StripWhitespace<CR>
nnoremap <F10> :NERDTreeToggle<CR>

" ===========
" Colorscheme
" ===========
" Setting dark mode
set background=dark

let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox_edited

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

" ======================
" YouCompleteMe Settings
" ======================
" let g:ycm_global_ycm_extra_conf= '~/.local/share/nvim/.ycm_extra_conf.py'
" let g:ycm_confirm_extra_conf=0
" let g:ycm_server_python_interpreter='/usr/bin/python'
" Disable preview window
" set completeopt-=preview

" ================================
" nvim completion manager settings
" ================================

" supress competion messages
set shortmess+=c

let g:cm_refresh_length = [[1, 3], [7, 1], [8, 3]]

" leave insert mode on Ctrl-C
inoremap <c-c> <ESC>

" use tab to select pop-up menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" ===================
" neosnippet settings
" ===================

let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }

let g:neosnippet#snippets_directory = "~/.config/nvim/snippets/"

" If snippet is expandable, expand it on Enter, else insert new line
imap <expr><CR>  (pumvisible() && neosnippet#expandable()) ? "\<Plug>(neosnippet_expand)" : "\<CR>"

imap <C-j> <Plug>(neosnippet_expand_or_jump)
smap <C-j> <Plug>(neosnippet_expand_or_jump)

" ================================================
" LaTeX specific settings
" check ./after/ftplugin/tex.vim for more settings
" ================================================
let g:neotex_enabled = 1
