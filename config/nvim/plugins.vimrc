call plug#begin()

" === Editing ===
" Trailing whitespace highlight & autofix
Plug 'ntpeters/vim-better-whitespace'

" auto-close plugin
Plug 'jiangmiao/auto-pairs'

" Surround brackets...
Plug 'tpope/vim-surround'

" Jump in file
Plug 'easymotion/vim-easymotion'

" fuzzy searching
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'lotabout/skim.vim'

" Search filename
Plug 'ctrlpvim/ctrlp.vim'

" --- Autocomplete ---
" Analysis
Plug 'dense-analysis/ale'
" Completion
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim', { 'for' : 'vim' }
Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
Plug 'ncm2/float-preview.nvim'

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

" Color on colors
" Plug 'norcalli/nvim-colorizer.lua'

" === Language plugin ===
" --- Toml ---
Plug 'cespare/vim-toml'

call plug#end()
