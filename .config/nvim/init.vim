" Behaviour
" make vim iMproved
set nocompatible
" use + clipboard by default
set clipboard=unnamedplus

" allow mouse in all modes
set mouse=a
" allow backspace to do everything
set backspace=indent,eol,start

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

" Hide buffers instead of closing them
set hidden

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

" Force vim to recognize .h files as C headers
augroup project
	autocmd!
	autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END

set foldmethod=marker

" plugins {{{
call plug#begin("~/.local/share/nvim/plugged")

	" highlighting trailing whitespaces
	Plug 'ntpeters/vim-better-whitespace'

	" cooler statusbar
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" GDB integration
	Plug 'sakhnik/nvim-gdb'

	Plug 'arcticicestudio/nord-vim'
	Plug 'chriskempson/base16-vim'

	" =====================
	" NeoVim as IDE plugins
	" =====================
	Plug 'ncm2/ncm2'
	Plug 'roxma/nvim-yarp' " required

	Plug 'ncm2/ncm2-tagprefix'
	Plug 'ncm2/ncm2-tmux'
	Plug 'ncm2/ncm2-vim'
	Plug 'ncm2/ncm2-path'
	Plug 'ncm2/ncm2-bufword'
	Plug 'ncm2/ncm2-ultisnips'

	Plug 'SirVer/ultisnips'		" snippets
	Plug 'honza/vim-snippets'

	Plug 'Shougo/neco-vim'		" vim configuration

	Plug 'Yggdroot/indentLine' " Indent lines

	" LSP Client
	Plug 'autozimu/LanguageClient-neovim', {
		\ 'branch': 'next',
		\ 'do': 'bash install.sh',
	\ }

	" (Optional) Multi-entry selection UI.
	Plug 'junegunn/fzf'
	" Show parameter doc.
	Plug 'Shougo/echodoc.vim'

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
" }}}

" colorscheme{{{
" Setting dark mode
set background=dark
set termguicolors
colorscheme base16-tomorrow-night"
" }}}

" Vim Airline Settings {{{
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
" }}}

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

" =====================
" LanguageClient-neovim
" =====================
let g:LanguageClient_serverCommands = {}

if executable('pyls')
	let g:LanguageClient_serverCommands.python = ['pyls']
endif

if executable('bash-language-server')
	let g:LanguageClient_serverCommands.sh = ['bash-language-server', 'start']
endif

if executable('cquery')
	let g:LanguageClient_serverCommands.cpp = [
		\ 'cquery',
		\ '--log-file=/tmp/cq.log',
		\ '--init={"cacheDirectory":"/var/cache/cquery/"}'
	\]
	let g:LanguageClient_serverCommands.c = [
		\ 'cquery',
		\ '--log-file=/tmp/cq.log',
		\ '--init={"cacheDirectory":"/var/cache/cquery/"}'
	\]
endif

nnoremap <silent> <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>

" =========
" UltiSnips
" =========
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
" c-j c-k for moving in snippet
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" ================================================
" LaTeX specific settings
" check ./after/ftplugin/tex.vim for more settings
" ================================================
let g:neotex_enabled = 1
