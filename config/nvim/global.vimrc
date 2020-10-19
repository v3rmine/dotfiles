scriptencoding utf-8
" (Force Vim to NOT behave like Vi)
set nocompatible
" General Settings
set encoding=UTF-8
set backspace=indent,eol,start
set ruler
set number
set relativenumber

au! InsertEnter * set norelativenumber
au! InsertLeave * set relativenumber

set noshowcmd
set incsearch
set hlsearch
" Enable syntax and plugins (for `netrw`)
syntax on
filetype plugin indent on

" Enable mouse
set mouse=a

" 256 Colors
set t_Co=256
" Enable true color support
set termguicolors

" Remap leader key
let g:mapleader=','

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
" Display all matching files when we tab complete, navigable with Tab and Shift+Tab
set wildmenu

" File browser
let g:netrw_banner=0			" disable annoying banner
let g:netrw_browse_split=3		" open in prior window
"" let g:netrw_altv=1			   " open splits to the right
let g:netrw_liststyle=3			" tree view
let g:netrw_list_hide='.*\.swp$' " hide vim swap files
"" let g:netrw_list_hide=netrw_gitignore#Hide()
"" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" ignore case when searching
set ignorecase
" if the search string has an upper case letter in it, the search will be case sensitive
set smartcase
" Automatically re-read file if a change was detected outside of vim
set autoread

" Tabs setup
set showmatch
set smarttab

" Line
set nowrap
set noruler
" Highlight current line
set cursorline

" Command line
set cmdheight=1

" Use system clipboard
set clipboard=unnamed

" Change vertical split character to be a space (essentially hide it)
set fillchars+=vert:.

" Don't dispay mode in command line (lightline already shows it)
set noshowmode

" Split right by default
set splitright

"" nmap <C-W> :set wrap<CR>
"" nmap <C-S-W> :set nowrap<CR>

" Go to tab by number
nmap <silent> <leader>t<Esc> :tabfirst<cr>
nmap <silent> <leader>t1 1gt
nmap <silent> <leader>t2 2gt
nmap <silent> <leader>t3 3gt
nmap <silent> <leader>t4 4gt
nmap <silent> <leader>t5 5gt
nmap <silent> <leader>t6 6gt
nmap <silent> <leader>t7 7gt
nmap <silent> <leader>t8 8gt
nmap <silent> <leader>t9 9gt
nmap <silent> <leader>t0 :tablast<cr>

nmap <silent> <C-T> :$tabedit scratchpad<cr>
nmap <silent> <C-W> :tabclose<cr>

" Completion config
" set completeopt=menu,menuone,preview,noselect,noinsert,longest
set completeopt=noinsert,menuone,noselect,longest

" Alias
fun! SetupCommandAlias(from, to)
	exec 'cnoreabbrev <expr> '.a:from
		\ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
		\ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun


call SetupCommandAlias("scratchpad", "tabedit scratchpad")
call SetupCommandAlias("type", "set syntax")

" Allows you to save files you opened without write permissions via sudo
cmap w!! w !sudo tee %

nmap q <Nop>
nmap <leader>qq :qa<cr>

nmap <silent> <C-Left> :wincmd h<cr>
nmap <silent> <C-Up> :wincmd k<cr>
nmap <silent> <C-Down> :wincmd j<cr>
nmap <silent> <C-Right> :wincmd l<cr>
nmap <silent> <C-H> :split<cr>
nmap <silent> <C-V> :vsplit<cr>
nmap <silent> <C-Q> :quit<cr>
fun! OpenCurrBufferNewTab()
	let l:bufnb = buffer_number()
	quit
	exec 'tab sb'.l:bufnb
endfun
nmap <silent> <C-c> :call OpenCurrBufferNewTab()<cr>
nmap <silent> gf :vertical wincmd f<CR>

" Tabs
fun! Retab2()
	:IndentGuidesDisable
	set ts=2 sw=2 et
	:normal gg=G
	:%retab!
	:IndentGuidesEnable
endfun
fun! Retab4()
	:IndentGuidesDisable
	set ts=4 sw=4 noet
	:normal gg=G
	:%retab!
	:IndentGuidesEnable
endfun

nmap s2 :call Retab2()<cr>
nmap s4 :call Retab4()<cr>

" Good undo / redo
nmap <silent> <u> :undo<cr>
nmap <silent> <S-U> :redo<cr>
