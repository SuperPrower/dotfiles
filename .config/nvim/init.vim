" init.vim is a configuration file for NeoVim.

" Behaviour Settings {{{
" make vim iMproved
set nocompatible
" use + clipboard by default
set clipboard=unnamedplus

" allow mouse in all modes
set mouse=a
" allow backspace to do everything
set backspace=indent,eol,start

set wildmenu
set wildmode=longest,full
set wildoptions=pum

set pumheight=30

set timeoutlen=500

set hidden

" Set persistent history and undo history/swap/backup files locations
set undofile
set undodir=~/.local/share/nvim/undo
set directory=~/.local/share/nvim/swap
set backupdir=~/.local/share/nvim/backup

set encoding=utf8

filetype plugin indent on
syntax enable

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
set colorcolumn=81
set number

set cursorline

set foldenable
set foldmethod=marker

" dark mode
set background=dark

set termguicolors

" split on another side
set splitright
set splitbelow

" Force vim to recognize .h files as C headers
augroup project
	autocmd!
	autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END

" wildignore {{{
" NerdTree is configured to respect this and ignore the patterns
" Python
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.hg,*.DS_Store

" LaTeX
set wildignore+=*.aux,*.lof,*.lot,*.fls,*.out,*.toc,*.fmt,*.fot,*.cb,*.cb2,.*.lb,*-converted-to.*,*.bbl,*.bcf,*.blg,*-blx.aux,*-blx.bib,*.run.xml,*.fdb_latexmk
" wildignore }}}

" }}}

" Key Bindings {{{
let mapleader = ";"

" kill buffer without closing the window
nnoremap <silent><leader>bd :bn\|bd#<CR>

" Switch buffers
nnoremap <silent><leader>bn :bn<cr>
nnoremap <silent><leader>bp :bp<cr>

" type russian
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
inoremap <C-l> <C-^>

" }}}

" Plugins {{{
call plug#begin("~/.local/share/nvim/plugged")

	" Appearence {{{

	" cooler statusbar
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" colorschemes
	" Plug 'arcticicestudio/nord-vim'
	" Plug 'chriskempson/base16-vim'
	Plug 'dracula/vim'

	" highlighting trailing whitespaces
	Plug 'ntpeters/vim-better-whitespace'

	" key help
	Plug 'liuchengxu/vim-which-key'

	" customizable quickmenu
	" Plug 'skywind3000/quickmenu.vim'
	Plug 'CharlesGueunet/quickmenu.vim'

	" }}}

	" Personal Wiki {{{
	Plug 'vimwiki/vimwiki'
	" taskwarrior integration
	Plug 'https://github.com/tbabej/taskwiki'
	" Personal Wiki }}}

	" NeoVim as IDE plugins {{{
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

	" EditorConfig
	Plug 'editorconfig/editorconfig-vim'

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

	" GDB integration
	Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }

	" vim surround
	Plug 'tpope/vim-surround'

	" file tree
	Plug 'https://github.com/scrooloose/nerdtree'
	Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'

	" tag tree
	Plug 'majutsushi/tagbar'

	" Better folding
	Plug 'Konfekt/FastFold'

	" NeoVim as IDE plugins }}}

	" File Types Support {{{

	" syntax highlighting
	Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'cespare/vim-toml', { 'for': 'toml' }
	Plug 'Shirk/vim-gas', { 'for': 'gas' }

	Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }
	Plug 'smancill/conky-syntax.vim'
	Plug 'tmux-plugins/vim-tmux'

	" LaTeX related plugins
	Plug 'lervag/vimtex', { 'for': 'tex' }
	Plug 'PietroPate/vim-tex-conceal', { 'for': 'tex' }

	" Markdown preview with grip
	Plug 'JamshedVesuna/vim-markdown-preview', { 'for': 'markdown' }

	" table mode
	Plug 'dhruvasagar/vim-table-mode'

	" Graphviz
	Plug 'wannesm/wmgraphviz.vim'

	" File Types Support }}}

	" Misc Behaviour {{{
	Plug 'lambdalisue/session.vim'
	Plug 'christoomey/vim-tmux-navigator'

	" Plug 'jiangmiao/auto-pairs'
	" Misc Behaviour }}}

call plug#end()
" Plugins }}}

" Plugin Key Bindings and Commands {{{
nnoremap <F7> :StripWhitespace<CR>
nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <F9> :TagbarToggle<CR>
" }}}

" Colorscheme {{{

" colorscheme base16-tomorrow-night
colorscheme dracula

" tmux doesn't support undercurl, let's replace it
" hi SpellBad gui=underline guisp=gui08
" hi SpellLocal gui=underline guisp=gui0C
" hi SpellCap gui=underline guisp=gui0D
" hi SpellRare gui=underline guisp=gui0E
" }}}

" vim-airline {{{
set noshowmode

let g:airline_powerline_fonts=0

if !exists('g:airline_symbols')
	let g:airline_symbols={}
endif

let g:airline_symbols.linenr=''
let g:airline_symbols.maxlinenr=''
let g:airline_symbols.whitespace=''

" Custom right-most part
call airline#parts#define_raw('line', (g:airline_symbols.linenr).' %#__accent_bold#%l/%L%#__restore__#')
let g:airline_section_z=airline#section#create(['line',':%v'])

let g:airline#extensions#keymap#enabled = 0
let g:airline_detect_iminsert=1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline_theme="minimalist"
" vim-airline }}}

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

" register Vimtex
au BufEnter * call ncm2#enable_for_buffer()
au User Ncm2Plugin call ncm2#register_source({
	\ 'name' : 'vimtex',
	\ 'priority': 1,
	\ 'subscope_enable': 1,
	\ 'complete_length': 1,
	\ 'scope': ['tex'],
	\ 'matcher': {'name': 'combine',
	\           'matchers': [
	\               {'name': 'abbrfuzzy', 'key': 'menu'},
	\               {'name': 'prefix', 'key': 'word'},
	\           ]},
	\ 'mark': 'tex',
	\ 'word_pattern': '\w+',
	\ 'complete_pattern': g:vimtex#re#ncm,
	\ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
\ })

" gdscript3 {{{
" au User Ncm2Plugin call ncm2#register_source({
" 	\ 'name' : 'gdscript3',
" 	\ 'priority': 1, 'complete_length': 1,
" 	\ 'subscope_enable': 1,
" 	\ 'scope': ['gdscript3'],
" 	\ 'mark': 'gdscript3',
" 	\ 'word_pattern': '[\w\-]+',
" 	\ 'complete_pattern': ':\s*',
" 	\ 'on_complete': ['ncm2#on_complete#omni', 'GDScriptComplete'],
" \ })
" }}}

" }}}

" LanguageClient-neovim {{{

let g:LanguageClient_serverCommands = {}

if executable('pyls')
	let g:LanguageClient_serverCommands.python = ['pyls', '-v']
endif


if executable('/home/superprower/.dub/packages/.bin/dls-latest/dls')
	let g:LanguageClient_serverCommands.d = ['/home/superprower/.dub/packages/.bin/dls-latest/dls']
endif

if executable('bash-language-server')
	let g:LanguageClient_serverCommands.sh = ['bash-language-server', 'start']
endif

if executable('go-langserver')
	let g:LanguageClient_serverCommands.go = ['go-langserver']
endif

if executable('clangd')
	let g:LanguageClient_serverCommands.cpp = [
		\ 'clangd',
	\]
	let g:LanguageClient_serverCommands.c = [
		\ 'clangd',
	\]
endif

" if executable('cquery')
" 	let g:LanguageClient_serverCommands.cpp = [
" 		\ 'cquery',
" 		\ '--log-file=/tmp/cq.log',
" 		\ '--init={"cacheDirectory":"/var/cache/cquery/"}'
" 	\]
" 	let g:LanguageClient_serverCommands.c = [
" 		\ 'cquery',
" 		\ '--log-file=/tmp/cq.log',
" 		\ '--init={"cacheDirectory":"/var/cache/cquery/"}'
" 	\]
" endif

nnoremap <silent> <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>

" }}}

" nvim-gdb {{{

function! NvimGdbNoTKeymaps()
	tnoremap <silent> <buffer> <esc> <c-\><c-n>
endfunction

let g:nvimgdb_config_override = {
	\ 'key_next': 'n',
	\ 'key_step': 's',
	\ 'key_finish': 'f',
	\ 'key_continue': 'c',
	\ 'key_until': 'u',
	\ 'key_breakpoint': 'b',
	\ 'set_tkeymaps': "NvimGdbNoTKeymaps",
	\ }
" }}}

" NerdTree {{{
let NERDTreeRespectWildIgnore=1
" NerdTree }}}

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

" imap <silent><C-j> <Plug>(neosnippet_jump_or_expand)
" smap <silent><C-j> <Plug>(neosnippet_jump_or_expand)
" xmap <silent><C-j> <Plug>(neosnippet_expand_target)

" }}}

" VimTex and LaTeX-specific settings {{{
" ====
" check ./after/ftplugin/tex.vim for more filetype-specific settings
" ====

let g:tex_flavor = "latex"
let g:tex_conceal = ''

let g:vimtex_fold_enabled = 1

let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'

" ncm2 VimTex source
autocmd Filetype tex call ncm2#register_source({
	\ 'name': 'vimtex',
	\ 'priority': 8,
	\ 'scope': ['tex'],
	\ 'mark': 'tex',
	\ 'word_pattern': '\w+',
	\ 'complete_pattern': g:vimtex#re#ncm2,
	\ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
	\ })

" VimTex and LaTeX-specific settings }}}

" Vim Surround {{{
" Allow wrapping in commands such as \textit
autocmd Filetype tex let g:surround_{char2nr('c')} = "\\\1command\1{\r}"
autocmd Filetype tex let g:tex_conceal="abdgms"
" Vim Surround }}}

" Markdown Preview settings {{{
" ====
" check ./after/ftplugin/markdown.vim for filetype-specific settings
" ====
let vim_markdown_preview_github = 1
let vim_markdown_preview_use_xdg_open = 1
" Markdown Preview settings }}}

" VimWiki {{{

" Prevent vimwiki from using Tab in insert mode
let g:vimwiki_table_mappins = 0
let g:vimwiki_global_ext = 0

let my_wiki = {}
let my_wiki.path = '~/vimwiki/'
let my_wiki.auto_export = 1

let g:vimwiki_list = [my_wiki]

" VimWiki }}}

" WhichKey Settings {{{
set timeoutlen=500

nnoremap <silent><leader> :<c-u>WhichKey ';'<CR>
vnoremap <silent><leader> :<c-u>WhichKeyVisual ';'<CR>

" disables gg
" nnoremap <silent> g :<c-u>WhichKey 'g'<CR>

" TODO: i need to map more leader things, and probably rebind leader to space
" let g:which_key_map =  {}
" let g:which_key_map['W'] = {
"       \ 'name' : '+windows' ,
"       \ 'w' : ['<C-W>w'     , 'other-window']          ,
"       \ 'd' : ['<C-W>c'     , 'delete-window']         ,
"       \ '-' : ['<C-W>s'     , 'split-window-below']    ,
"       \ '|' : ['<C-W>v'     , 'split-window-right']    ,
"       \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
"       \ 'h' : ['<C-W>h'     , 'window-left']           ,
"       \ 'j' : ['<C-W>j'     , 'window-below']          ,
"       \ 'l' : ['<C-W>l'     , 'window-right']          ,
"       \ 'k' : ['<C-W>k'     , 'window-up']             ,
"       \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
"       \ 'J' : ['resize +5'  , 'expand-window-below']   ,
"       \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
"       \ 'K' : ['resize -5'  , 'expand-window-up']      ,
"       \ '=' : ['<C-W>='     , 'balance-window']        ,
"       \ 's' : ['<C-W>s'     , 'split-window-below']    ,
"       \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
"       \ '?' : ['Windows'    , 'fzf-window']            ,
"       \ }
"
" call which_key#register('\', "g:which_key_map")

" WhichKey Settings }}}

" quickmenu settings {{{

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

" QuickMenu for Vimwiki }}}

" quickmenu settings }}}
