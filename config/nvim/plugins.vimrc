call plug#begin()

" === Editing ===
" Trailing whitespace highlight & autofix
Plug 'ntpeters/vim-better-whitespace'

" auto-close plugin
"Plug 'rstacruz/vim-closer'
Plug 'jiangmiao/auto-pairs'

" Surround brackets...
Plug 'tpope/vim-surround'

" Ctags / Gtags
Plug 'jsfaint/gen_tags.vim'

" Autoformat
Plug 'Chiel92/vim-autoformat'

" fuzzy file searching
Plug 'lotabout/skim.vim'

" --- Autocomplete ---
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
"Plug 'Shougo/neoinclude.vim'
"Plug 'jsfaint/coc-neoinclude'
"Plug 'neoclide/coc.nvim', {'branch': 'release', 'tag': '*', 'do': { -> coc#util#install()}}

" autocomplete JSs imports
Plug 'galooshi/vim-import-js', { 'do': 'npm install -g import-js' }

" Shougo/denite.nvim
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

" Print function signature in echo area
Plug 'Shougo/echodoc.vim'

" Better comments
Plug 'scrooloose/nerdcommenter'

" Autoformat
Plug 'sbdchd/neoformat'

" Code Folding
Plug 'tmhedberg/SimpylFold'

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
Plug 'mbbill/undotree'

" Indentation help
Plug 'nathanaelkane/vim-indent-guides'

" Local-wiki
Plug 'vimwiki/vimwiki'

" === Language plugin ===
" --- Golang ---
Plug 'stamblerre/gocode', { 'rtp': 'vim', 'do': '~/.config/nvim/plugged/gocode/vim/symlink.sh' }
Plug 'fatih/vim-go' ", { 'do': ':GoUpdateBinaries' }

" --- Markdown ---
"Plug 'vim-pandoc/vim-pandoc'
"Plug 'vim-pandoc/vim-pandoc-syntax'

" --- Javascript / Typescript ---
" Typescript syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'
" React JSX syntax highlighting
Plug 'mxw/vim-jsx'

" Syntax highlighting for javascript libraries
Plug 'othree/javascript-libraries-syntax.vim'
" Improved syntax highlighting and indentation
Plug 'othree/yajs.vim'

" Generate JSDoc based on code
Plug 'heavenshell/vim-jsdoc'

" --- C/C++ ---
" Debug / Breakpoints
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }

" --- Elixir ---
"Plug 'elixir-lang/vim-elixir'
"Plug 'thinca/vim-ref'
"Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }

" --- Toml ---
Plug 'cespare/vim-toml'

" Buffer management
"Plug 'jeetsukumaran/vim-buffergator'

call plug#end()
