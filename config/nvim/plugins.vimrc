call plug#begin()

" === Editing ===
" Trailing whitespace highlight & autofix
Plug 'ntpeters/vim-better-whitespace'

" auto-close plugin
Plug 'jiangmiao/auto-pairs'

" Surround brackets...
Plug 'tpope/vim-surround'

" fuzzy file searching
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'lotabout/skim.vim'

" Search in files
Plug 'ctrlpvim/ctrlp.vim'

" --- Autocomplete ---
Plug 'dense-analysis/ale'

" Print function signature in echo area
Plug 'Shougo/echodoc.vim'

" Better comments
Plug 'scrooloose/nerdcommenter'

" Autoformat
Plug 'sbdchd/neoformat'
Plug 'Chiel92/vim-autoformat'

" Code Folding
Plug 'tmhedberg/SimpylFold'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Gitlab Review
"" Plug 'google/vim-maktaba'
"" Plug 'google/vim-glaive'
"" Plug 'LucHermitte/lh-vim-lib'
"" Plug 'omrisarig13/vim-mr-interface'

" === UI ===
" Bottom bar theme
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" Editor Theme
"Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'mhartington/oceanic-next'

" Icons
Plug 'ryanoasis/vim-devicons'

" Sidebar undo history
" Plug 'mbbill/undotree'

" Indentation help
Plug 'nathanaelkane/vim-indent-guides'

" Local-wiki
Plug 'vimwiki/vimwiki'

" === Language plugin ===
" --- Toml ---
Plug 'cespare/vim-toml'

call plug#end()
