scriptencoding utf-8
" General Settings
set encoding=UTF-8
set t_Co=256
set nocompatible
filetype plugin on
let g:mapleader=','
syntax on
" Line number
set number
set nu

" Editor
set mouse=a
set noshowcmd

" Enable true color support
set termguicolors

" Editor theme
set background=dark
try
  colorscheme OceanicNext
catch
  colorscheme slate
endtry

" ignore case when searching
set ignorecase

" if the search string has an upper case letter in it, the search will be case sensitive
set smartcase

" Automatically re-read file if a change was detected outside of vim
set autoread

" Add custom highlights in method that is executed every time a colorscheme is sourced
" See https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f for details
function! MyHighlights() abort
  " Hightlight trailing whitespace
  highlight Trail ctermbg=red guibg=red
  call matchadd('Trail', '\s\+$', 100)
endfunction

augroup MyColors
  autocmd!
  autocmd ColorScheme * call MyHighlights()
augroup END

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
set splitbelow

" Don't dispay mode in command line (lightline already shows it)
set noshowmode

"nmap <C-W> :set wrap<CR>
"nmap <C-S-W> :set nowrap<CR>
