" == Behaviour Settings == {{{
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

set foldenable
set foldmethod=marker
" }}}

" == Plugins == {{{
call plug#begin("~/.local/share/nvim/plugged")

	" ==========
	" Appearence
	" ==========

	" cooler statusbar
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" colorschemes
	Plug 'arcticicestudio/nord-vim'
	Plug 'chriskempson/base16-vim'

	" GDB integration
	Plug 'sakhnik/nvim-gdb'

	" vim surround
	Plug 'tpope/vim-surround'

	" highlighting trailing whitespaces
	Plug 'ntpeters/vim-better-whitespace'

	" key help
	Plug 'liuchengxu/vim-which-key'

	" personal wiki
	Plug 'vimwiki/vimwiki'

	" calendar
	Plug 'mattn/calendar-vim'

	" customizable quickmenu
	" Plug 'skywind3000/quickmenu.vim'
	Plug 'CharlesGueunet/quickmenu.vim'

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

	" Snippets
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'

	" Snippets for vim configuration
	Plug 'Shougo/neco-vim'

	" LSP Client
	Plug 'autozimu/LanguageClient-neovim', {
		\ 'branch': 'next',
		\ 'do': 'bash install.sh',
	\ }

	" (Optional) Multi-entry selection UI.
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	" Show parameter doc.
	Plug 'Shougo/echodoc.vim'

	" local project vimrc
	Plug 'embear/vim-localvimrc'

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

	" Better folding
	Plug 'Konfekt/FastFold'

	" LaTeX related plugins
	" Plug 'donRaphaco/neotex', { 'for': 'tex' }
	Plug 'lervag/vimtex', { 'for': 'tex' }

	" Markdown preview with grip
	Plug 'JamshedVesuna/vim-markdown-preview', { 'for': 'markdown' }
	" table mode
	Plug 'dhruvasagar/vim-table-mode'

	" Graphviz
	Plug 'wannesm/wmgraphviz.vim'

call plug#end()
" }}}

" Colorscheme{{{
" Setting dark mode
set background=dark
set termguicolors
colorscheme base16-tomorrow-night

" tmux doesn't support undercurl, let's replace it
hi SpellBad gui=underline guisp=gui08
hi SpellLocal gui=underline guisp=gui0C
hi SpellCap gui=underline guisp=gui0D
hi SpellRare gui=underline guisp=gui0E
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

let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 1


" }}}

" == Key Bindings and Commands == {{{
nnoremap <F7> :StripWhitespace<CR>
nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <F9> :TagbarToggle<CR>

" use tab to select pop-up menu - ncm/deoplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" kill buffer without closing the window
nnoremap <silent><leader>d :bn\|bd#<CR>

" }}}

" ncm2 settings {{{

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

" }}}

" LanguageClient-neovim {{{

let g:LanguageClient_serverCommands = {}

if executable('pyls')
	let g:LanguageClient_serverCommands.python = ['pyls']
endif


if executable('/home/superprower/.dub/packages/.bin/dls-latest/dls')
	let g:LanguageClient_serverCommands.d = ['/home/superprower/.dub/packages/.bin/dls-latest/dls']
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

" }}}

" NerdTree Git Plugin {{{
let g:NERDTreeIndicatorMapCustom = {
	\ "Modified"  : "M",
	\ "Staged"    : "+",
	\ "Untracked" : "U",
	\ "Renamed"   : "R",
	\ "Unmerged"  : "=",
	\ "Deleted"   : "X",
	\ "Dirty"     : "D",
	\ "Clean"     : "C",
	\ 'Ignored'   : 'I',
	\ "Unknown"   : "?"
	\ }

" }}}

" FastFold Settings {{{

let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

let g:tex_fold_enabled = 0
let g:markdown_folding = 1

" }}}

" UltiSnips {{{

inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
" c-j c-k for moving in snippet
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" }}}

" LaTeX specific settings {{{
" ================================================
" check ./after/ftplugin/tex.vim for more settings
" ================================================

let g:tex_flavor = "latex"
let g:tex_conceal = ''

let g:vimtex_fold_enabled = 1

let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'

" ncm2 vimtex source
autocmd Filetype tex call ncm2#register_source({
	\ 'name': 'vimtex',
	\ 'priority': 8,
	\ 'scope': ['tex'],
	\ 'mark': 'tex',
	\ 'word_pattern': '\w+',
	\ 'complete_pattern': g:vimtex#re#ncm2,
	\ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
	\ })

" old neotex settings
" let g:neotex_enabled = 1
" }}}

" Markdown specific settings {{{
" =====================================================
" check ./after/ftplugin/markdown.vim for more settings
" =====================================================
let vim_markdown_preview_github = 1
let vim_markdown_preview_use_xdg_open = 1
" }}}

" indentLine settings
let g:indentLine_fileTypeExclude = ['json']
let g:indentLine_bufTypeExclude = ['help', 'terminal']

" == vimwiki config == {{{
" Prevent vimwiki from using Tab in insert mode
let g:vimwiki_table_mappins = 0
let g:vimwiki_global_ext = 0

let my_wiki = {}
let my_wiki.path = '~/vimwiki/'
let my_wiki.auto_export = 1

let g:vimwiki_list = [my_wiki]

" }}}

" whick key settings
nnoremap <silent> <leader> :WhichKey '\'<CR>
set timeoutlen=500

" == quickmenu settings == {{{

" enable cursorline (L) and cmdline help (H)
let g:quickmenu_options = "LH"

" clear all the items
call g:quickmenu#reset()

" bind to F12
noremap <silent><F12> :call quickmenu#toggle(0)<cr>

" QuickMenu for Vimwiki {{{

" call g:quickmenu#append('', '', '', 'vimwiki')

" Wiki Entries Section
call g:quickmenu#append('# Wiki Entries', '', '', 'vimwiki')

call g:quickmenu#append('Open Wiki Index', 'VimwikiIndex', '', 'vimwiki')
call g:quickmenu#append('Browse this page', 'Vimwiki2HTMLBrowse', '', 'vimwiki')
call g:quickmenu#append('Rename this page', 'VimwikiRenameLink', '', 'vimwiki')
call g:quickmenu#append('Split and Follow Link', 'VimwikiVSplitLink', '', 'vimwiki')

" Diary Section
call g:quickmenu#append('# Diary Entries', '', '', 'vimwiki')

call g:quickmenu#append('Open Diary Index', 'VimwikiDiaryIndex', '', 'vimwiki')
call g:quickmenu#append("Open Today's Diary Entry", 'VimwikiMakeDiaryNote', '', 'vimwiki')
call g:quickmenu#append("Open Tomorrows's Diary Entry", 'VimwikiMakeTomorrowDiaryNote', '', 'vimwiki')
call g:quickmenu#append('Update Diary Index', 'VimwikiDiaryGenerateLinks', '', 'vimwiki', 0, 'u')

" Misc Section
call g:quickmenu#append('# Vimwiki Misc', '', '', 'vimwiki')

call g:quickmenu#append('Create new table', 'VimwikiTable', '', 'vimwiki')
call g:quickmenu#append('Open a Calendar', 'Calendar', '', 'vimwiki')

" }}}

" }}}
