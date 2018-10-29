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
" set autoindent
set noexpandtab
set tabstop=8
set shiftwidth=8
set linebreak
set breakindent
set showbreak=..

" Interface
set laststatus=2
" set ttimeoutlen=10
" set t_Co=16
set colorcolumn=100
set number

set nofoldenable

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
	" Plug 'kana/vim-submode'

	" highlighting trailing whitespaces
	Plug 'ntpeters/vim-better-whitespace'

	" cooler statusbar
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" GDB integration
	" Plug 'vim-scripts/Conque-GDB'
	Plug 'sakhnik/nvim-gdb'

	" colorscheme fast preview
	" Plug 'xolox/vim-misc'
	" Plug 'xolox/vim-colorscheme-switcher'

	Plug 'arcticicestudio/nord-vim'
	Plug 'chriskempson/base16-vim'

	" =====================
	" NeoVim as IDE plugins
	" =====================
	Plug 'ncm2/ncm2'
	Plug 'roxma/nvim-yarp' " required

	Plug 'ncm2/ncm2-pyclang'
	Plug 'ncm2/ncm2-jedi'

	Plug 'ncm2/ncm2-neoinclude'
	Plug 'ncm2/ncm2-tagprefix'
	Plug 'ncm2/ncm2-tmux'
	Plug 'ncm2/ncm2-vim'
	Plug 'ncm2/ncm2-path'
	Plug 'ncm2/ncm2-bufword'
	Plug 'ncm2/ncm2-ultisnips'

	Plug 'Shougo/neoinclude.vim'	" include files
	Plug 'Shougo/neco-vim'		" vim configuration
	Plug 'SirVer/ultisnips'		" snippets
	Plug 'honza/vim-snippets'

	Plug 'ludovicchabant/vim-gutentags'	" CTags

	Plug 'w0rp/ale'	" Linting

	Plug 'Yggdroot/indentLine' " Indent lines

	" file tree
	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'

	" tag tree
	Plug 'majutsushi/tagbar'

	" syntax highlighting
	Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }
	Plug 'smancill/conky-syntax.vim'
	Plug 'tmux-plugins/vim-tmux'
	Plug 'Shirk/vim-gas', { 'for': 'gas' }

	" LaTeX related plugins
	" Plug 'lervag/vimtex', { 'for': 'tex' }
	Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
	Plug 'donRaphaco/neotex', { 'for': 'tex' }

	" Graphviz
	Plug 'wannesm/wmgraphviz.vim'

call plug#end()

" ===========
" Colorscheme
" ===========
" Setting dark mode
set background=dark

" let g:gruvbox_contrast_dark='hard'
" colorscheme gruvbox_edited

" Nord theme
" let g:nord_italic = 1
" let g:nord_italic_comments = 1
"
" set termguicolors
" let g:nord_comment_brightness = 15
"
" let g:nord_uniform_diff_background = 1
"
" colorscheme nord

" Base16 Theme
set termguicolors
colorscheme base16-tomorrow-night

" ====================
" Vim Airline Settings
" ====================
let g:airline_powerline_fonts=1
let g:airline_theme="base16_twilight"

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

" ============
" Key Bindings
" ============
nnoremap <F7> :StripWhitespace<CR>
nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <F9> :TagbarToggle<CR>

" use tab to select pop-up menu - ncm/deoplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" ================================
" ncm2 settings
" ================================

autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" suppress competion messages
set shortmess+=c

let g:ncm2#complete_length = [[1, 3], [7, 2], [8, 3]]

" enable auto complete for `<backspace>`, `<c-w>` keys.
" known issue https://github.com/ncm2/ncm2/issues/7
au TextChangedI * call ncm2#auto_trigger()

" leave insert mode on Ctrl-C
" inoremap <c-c> <ESC>

" ============
" ncm2-pyclang
" ============
" path to directory where libclang.so can be found
" let g:ncm2_pyclang#library_path = '/usr/lib/llvm-5.0/lib'
" or path to the libclang.so file
let g:ncm2_pyclang#library_path = '/usr/lib64/libclang.so'
let g:ncm2_pyclang#args_file_path = ['.clang_complete']

" =========
" UltiSnips
" =========
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
" c-j c-k for moving in snippet
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
" let g:UltiSnipsRemoveSelectModeMappings = 0


" ================================================
" LaTeX specific settings
" check ./after/ftplugin/tex.vim for more settings
" ================================================
let g:neotex_enabled = 1

" ============
" old settings
" ============
"
" =================
" deoplete settings
" =================

" deoplete options
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_smart_case = 1

" deoplete-clang
" let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"
" let g:deoplete#sources#clang#clang_header = "/usr/lib/clang"

" tmux-complete
" let g:tmuxcomplete#trigger = ''
" ===================
" neosnippet settings
" ===================
"
"let g:neosnippet#enable_completed_snippet = 1
"let g:neosnippet#disable_runtime_snippets = {
"\   '_' : 1,
"\ }
"
"let g:neosnippet#snippets_directory = "~/.config/nvim/snippets/"
"
"" If snippet is expandable, expand it on Enter, else insert new line
"imap <expr><CR>  (pumvisible() && neosnippet#expandable()) ? "\<Plug>(neosnippet_expand)" : "\<CR>"
"
"imap <expr><C-j> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<C-j>"
"smap <expr><C-j> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<C-j>"
"
" ============
" Vim Submodes
" ============
" More natural splits
" set splitbelow          " Horizontal split below current.
" set splitright          " Vertical split to right of current.
"
" call submode#enter_with('splits', 'n', '', '<C-w>')
" call submode#leave_with('splits', 'n', '', '<Esc>')
" " navigate splits
" call submode#map('splits', 'n', '', 'h', '<C-w>h')
" call submode#map('splits', 'n', '', 'j', '<C-w>j')
" call submode#map('splits', 'n', '', 'k', '<C-w>k')
" call submode#map('splits', 'n', '', 'l', '<C-w>l')
" " move splits to the edges of the screen
" call submode#map('splits', 'n', '', 'H', '<C-w>H')
" call submode#map('splits', 'n', '', 'J', '<C-w>J')
" call submode#map('splits', 'n', '', 'K', '<C-w>K')
" call submode#map('splits', 'n', '', 'L', '<C-w>L')
" " grow split wider/thinner
" call submode#map('splits', 'n', '', ',', '<C-w><')
" call submode#map('splits', 'n', '', '.', '<C-w>>')
" " grop split up/down
" call submode#map('splits', 'n', '', '=', '<C-w>+')
" call submode#map('splits', 'n', '', '-', '<C-w>-')
" " rotate splits
" call submode#map('splits', 'n', '', 'r', '<C-w>r')
" call submode#map('splits', 'n', '', 'R', '<C-w>R')
"
" let g:submode_timeout = 0
" let g:submode_always_show_submode = 1
