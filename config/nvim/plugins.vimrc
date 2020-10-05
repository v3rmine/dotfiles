call plug#begin()

" === Editing ===
" Trailing whitespace highlight & autofix
Plug 'ntpeters/vim-better-whitespace'

" auto-close plugin
" Plug 'jiangmiao/auto-pairs'

" Surround brackets...
Plug 'tpope/vim-surround'

" fuzzy file searching
" Plug 'lotabout/skim.vim'

" --- Autocomplete ---
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" Plug 'junegunn/fzf'

" Print function signature in echo area
" Plug 'Shougo/echodoc.vim'

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
Plug 'google/vim-maktaba'
Plug 'google/vim-glaive'
Plug 'LucHermitte/lh-vim-lib'
Plug 'omrisarig13/vim-mr-interface'

" === UI ===
" Bottom bar theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes', { 'do': 'cp $HOME/.config/nvim/space.vim $HOME/.config/nvim/plugged/vim-airline-themes/autoload/airline/themes/space.vim' }
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
