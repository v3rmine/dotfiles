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
" Display all matching files when we tab complete, navigable with Tab and Shift+Tab
set wildmenu

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
"" set tabstop=4
"" set shiftwidth=4
"" set softtabstop=4
"" set noexpandtab
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

nmap <silent> <C-T> :tabedit scratchpad<cr>
nmap <silent> <C-W> :tabclose<cr>

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

" Allows you to save files you opened without write permissions via sudo
cmap w!! w !sudo tee %

nmap q <Nop>
nmap <leader>qq :qa<cr>

nmap <silent> <C-Left> :wincmd h<cr>
nmap <silent> <C-Up> :wincmd k<cr>
nmap <silent> <C-Down> :wincmd j<cr>
nmap <silent> <C-Right> :wincmd l<cr>
nmap <silent> <C-q> :quit<cr>

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

" Language
augroup rust
    fun! RustConfig()
        set ts=2 sw=2 noet
        nmap <M-r> :!cargo run<cr>
        nmap <M-c> :!cargo clippy<cr>
        nmap <M-b> :!cargo build<cr>
        nmap <M-B> :!cargo build --release<cr>
        nmap <M-f> :%! rustfmt --config hard_tabs=true<cr>
    endfun
    au! BufNewFile,BufFilePre,BufRead *.rs call RustConfig()
augroup END

augroup vue
    fun! VueConfig()
        set ts=4 sw=4 et
        nmap <M-l> :!yarn lint<cr>
        :LanguageClientStart
    endfun
    au! BufNewFile,BufRead *.vue set filetype=vue
    au! filetype vue call VueConfig()
augroup END