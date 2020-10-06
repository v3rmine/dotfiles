scriptencoding utf-8
" General Settings
set encoding=UTF-8
" 256 Colors
set t_Co=256
" Enable true color support
set termguicolors
" (Force Vim to NOT behave like Vi)
set nocompatible
" Enable syntax and plugins (for `netrw`)
filetype plugin on
syntax enable
" Line number
set number
set nu

" Remap leader key
let g:mapleader=','

" Editor
set mouse=a
set noshowcmd

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
let g:netrw_browse_split=4      " open in prior window
let g:netrw_altv=1              " open splits to the right
let g:netrw_liststyle=3         " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

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

" Completion
set shortmess+=c

" UI
" Change vertical split character to be a space (essentially hide it)
set fillchars+=vert:.

" Set preview window to appear at bottom
" set splitbelow

" Don't dispay mode in command line (lightline already shows it)
set noshowmode

nmap <C-W> :set wrap<CR>
nmap <C-S-W> :set nowrap<CR>

" Go to tab by number
noremap <leader>t1 1gt
noremap <leader>t2 2gt
noremap <leader>t3 3gt
noremap <leader>t4 4gt
noremap <leader>t5 5gt
noremap <leader>t6 6gt
noremap <leader>t7 7gt
noremap <leader>t8 8gt
noremap <leader>t9 9gt
noremap <leader>t0 :tablast<cr>
