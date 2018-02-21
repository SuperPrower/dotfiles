" Behaviour
set nocompatible 			" make vim iMproved
set clipboard=unnamedplus		" use + clipboard by default

set mouse=a 				" allow mouse in all modes
set backspace=indent,eol,start 		" allow backspace to do everything

set wildmenu
set wildmode=longest,list

set undofile 				" persistent history
set undodir=~/.local/share/nvim/undo	" undo history location
set directory=~/.local/share/nvim/swap	" swap files location
set backupdir=~/.local/share/nvim/backup	" backup files location

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
set colorcolumn=110
set number

" Force vim to recognize .h files as C headers
augroup project
	autocmd!
	autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END

" LaTeX specific settings:
augroup LaTeX_settings
	autocmd!
	autocmd FileType tex set spelllang=ru,en
	autocmd FileType tex set spell
	autocmd FileType tex set tabstop=4
	autocmd FileType tex set shiftwidth=4
	autocmd FileType tex nnoremap <F6> :VQLNInsertNote<CR>
augroup end

" =======
" Plugins
" =======
call plug#begin("~/.local/share/nvim/plugged")

	" custom submodes
	Plug 'kana/vim-submode'

	" cooler statusbar
	Plug 'itchyny/lightline.vim'


	" GDB integration
	Plug 'vim-scripts/Conque-GDB'

	" colorscheme fast preview
	Plug 'xolox/vim-misc'
	Plug 'xolox/vim-colorscheme-switcher'

	" file tree
	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'

	" ============== code completion ============================
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	" === clang
	" Plug 'zchee/deoplete-clang'
	" Plug 'tweekmonster/deoplete-clang2'
	" Plug 'Rip-Rip/clang_complete'
	" === python 
	Plug 'zchee/deoplete-jedi', { 'for' : 'python' }
	" ===========================================================

	" syntax highlighting for i3wm configuration file
	Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }

	" LaTeX related plugins
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
nnoremap <F7> :call TrimWhitespace()<CR>:w<CR>:echo "Removed trailing whitespace and saved"<CR>
nnoremap <F10> :NERDTreeToggle<CR>

" ======================
" Vim LightLine Settings
" ======================
let g:lightline = {
	\ 'colorscheme' : 'one',
	\ }
" Get rid of default mode indicator
set noshowmode

" =========================
" Markdown Preview Settings
" =========================
" let vim_markdown_preview_toggle=0
" let vim_markdown_preview_github=1
" let vim_markdown_preview_use_xdg_open=1

" =================
" Deoplete Settings
" =================
" Use deoplete.
let g:deoplete#enable_at_startup = 1

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

