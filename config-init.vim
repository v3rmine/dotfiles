call plug#begin()

" Bottom bar theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Sidebar explorer
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Pairs quotes, brackets...
Plug 'jiangmiao/auto-pairs'

" Better comments
Plug 'scrooloose/nerdcommenter'
"" Plug 'sbdchd/neoformat'

" Snippets management
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

" Find in files
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'

" Find in files name
"Plug 'ctrlpvim/ctrlp.vim'

" Sidebar undo history
Plug 'mbbill/undotree'

" Expand selection
Plug 'terryma/vim-expand-region'

" Universal cTags 
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'majutsushi/tagbar'

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make' }
Plug 'sebastianmarkow/deoplete-rust'
Plug 'deoplete-plugins/deoplete-docker'
Plug 'carlitux/deoplete-ternjs' ", { 'do': 'npm install -g tern' }

" Go lang commands
Plug 'stamblerre/gocode', { 'rtp': 'vim', 'do': '~/.config/nvim/plugged/gocode/vim/symlink.sh' }
Plug 'fatih/vim-go' ", { 'do': ':GoUpdateBinaries' } 

"Plug 'vim-pandoc/vim-pandoc'
"Plug 'vim-pandoc/vim-pandoc-syntax'

"" Plug 'neomake/neomake'

"" Plug 'terryma/vim-multiple-cursors'

" Indentation help
Plug 'nathanaelkane/vim-indent-guides'

" Docker tools
"Plug 'ekalinin/Dockerfile.vim'
"Plug 'kevinhui/vim-docker-tools'
"Plug 'skanehira/docker-compose.vim'

" Coq & Gallina 
"Plug 'let-def/vimbufsync'
"Plug 'joxcat/coq.vim'
"Plug 'whonore/coqtail'

" Moonscript & Lua
"Plug 'leafo/moonscript-vim'
"Plug 'svermeulen/nvim-moonmaker'

call plug#end()

" Theme settings
syntax enable
"" colors OceanicNext
"" if (has("termguicolors"))
""    set termguicolors
"" endif

" General Settings
set encoding=UTF-8

" Utilisnip
let g:UltiSnipsExpandTrigger="<tab>"

" Enable deoplete
let g:deoplete#enable_at_startup = 1
"let g:deoplete#sources#rust#racer_binary='$HOME/.cargo/bin/racer'
"let g:deoplete#sources#rust#rust_source_path='$HOME/.config/nvim/rust-src/rust/src'

" Display line number
set number
set nu

" Blink cursor on error
set visualbell
set t_vb=

" Tabs setup
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set ruler
set showmatch
set smarttab

"" Tabs for Coq
"autocmd Filetype coq setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

"" For Coqtail
"filetype plugin indent on
"syntax on

"" Python
"let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
