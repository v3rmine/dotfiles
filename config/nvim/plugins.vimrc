call plug#begin()

" === Editing ===
" auto-close plugin
Plug 'jiangmiao/auto-pairs'

" Surround brackets...
" Plug 'tpope/vim-surround'

" Jump in file
Plug 'easymotion/vim-easymotion'

" fuzzy searching
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'lotabout/skim.vim'

" Search filename
Plug 'ctrlpvim/ctrlp.vim'

" Polyglot language pack
"" Plug 'sheerun/vim-polyglot'

" --- Autocomplete ---
" Syntax scan
Plug 'w0rp/ale'
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
Plug 'ncm2/ncm2-ultisnips'

" Better comments
Plug 'scrooloose/nerdcommenter'

" Autoformat
"" Plug 'sbdchd/neoformat'
"" Plug 'Chiel92/vim-autoformat'

" Code Folding
Plug 'Konfekt/FastFold'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Snippets
Plug 'SirVer/ultisnips'

" === UI ===
" Bottom bar theme
Plug 'itchyny/lightline.vim'

" Editor Theme
Plug 'joshdick/onedark.vim'
" Plug 'mhartington/oceanic-next'

" Indentation help
Plug 'nathanaelkane/vim-indent-guides'
" Autodetect indent
Plug 'tpope/vim-sleuth'

" Local-wiki
"" Plug 'vimwiki/vimwiki'

" Color on colors
Plug 'norcalli/nvim-colorizer.lua'

" Code context
Plug 'wellle/context.vim'

" Distraction free markdown
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Interactive terminal
Plug 'kassio/neoterm'

" === Language plugin ===
" --- Toml ---
Plug 'cespare/vim-toml'

" --- Markdown --- "
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-pandoc-syntax'

" --- Javascript ---
" Syntax base
Plug 'othree/yajs.vim'
" Syntax ES6
Plug 'othree/es.next.syntax.vim'
" Auto-import
Plug 'galooshi/vim-import-js'

" --- VueJS ---
Plug 'posva/vim-vue'

call plug#end()
