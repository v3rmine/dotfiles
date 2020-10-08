scriptencoding utf-8
" (Force Vim to NOT behave like Vi)
set nocompatible
" General Settings
set encoding=UTF-8
set backspace=indent,eol,start
set ruler
set number
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
" Display all mathicng files when we tab complete, navigable with Tab and Shift+Tab
set wildmenu

" Editor theme
set background=dark
try
  colorscheme OceanicNext
catch
  colorscheme slate
endtry

" File browser
let g:netrw_banner=0            " disable annoying banner
let g:netrw_browse_split=3      " open in prior window
"" let g:netrw_altv=1              " open splits to the right
let g:netrw_liststyle=3         " tree view
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
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set showmatch
set smarttab

" Line
set nowrap
set nocursorline
set noruler

" Command line
set cmdheight=1

" Use system clipboard
set clipboard=unnamed

" UI
" Change vertical split character to be a space (essentially hide it)
set fillchars+=vert:.

" Set preview window to appear at bottom
" set splitbelow

" Don't dispay mode in command line (lightline already shows it)
set noshowmode

"" nmap <C-W> :set wrap<CR>
"" nmap <C-S-W> :set nowrap<CR>

" Go to tab by number
nmap <leader>t1 1gt
nmap <leader>t2 2gt
nmap <leader>t3 3gt
nmap <leader>t4 4gt
nmap <leader>t5 5gt
nmap <leader>t6 6gt
nmap <leader>t7 7gt
nmap <leader>t8 8gt
nmap <leader>t9 9gt
nmap <leader>t0 :tablast<cr>

nmap <C-T> :tabedit scratchpad<cr>
nmap <C-W> :tabclose<cr>

" Completion config
set completeopt=menu,menuone,preview,noselect,noinsert

" Alias
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun

call SetupCommandAlias("scratchpad", "tabedit scratchpad")
call SetupCommandAlias("type", "set syntax")

" Tabs switcher
function! UseTabs()
  set tabstop=4     " Size of a hard tabstop (ts).
  set shiftwidth=4  " Size of an indentation (sw).
  set noexpandtab   " Always uses tabs instead of space characters (noet).
  set autoindent    " Copy indent from current line when starting a new line (ai).
endfunction
nmap <leader>st :call UseTabs()<cr>

function! UseSpaces()
  set tabstop=2     " Size of a hard tabstop (ts).
  set shiftwidth=2  " Size of an indentation (sw).
  set expandtab     " Always uses spaces instead of tab characters (et).
  set softtabstop=0 " Number of spaces a <Tab> counts for. When 0, featuer is off (sts).
  set autoindent    " Copy indent from current line when starting a new line.
  set smarttab      " Inserts blanks on a <Tab> key (as per sw, ts and sts).
endfunction
nmap <leader>ss :call UseSpaces()<cr>

" function! SetType(type)
"     set syntax=a:type
"     set filetype=a:type
" endfunction

" command! -nargs=1 Type call SetType(<f-args>)

nmap <leader>qq :qa<cr>
