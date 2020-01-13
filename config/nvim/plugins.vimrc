call plug#begin()

" Bottom bar theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Sidebar explorer
"Plug 'scrooloose/nerdtree'
"Plug 'ryanoasis/vim-devicons'

" Pairs quotes, brackets...
Plug 'jiangmiao/auto-pairs'

" Better comments
Plug 'scrooloose/nerdcommenter'
"" Plug 'sbdchd/neoformat'

" Autoformat
Plug 'sbdchd/neoformat'

" Code Folding
Plug 'tmhedberg/SimpylFold'

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
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'deoplete-plugins/deoplete-go', { 'do': 'make' }
"Plug 'sebastianmarkow/deoplete-rust'
"Plug 'deoplete-plugins/deoplete-docker'
"Plug 'carlitux/deoplete-ternjs' ", { 'do': 'npm install -g tern' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-snippets', 'coc-highlight', 'coc-git', 'coc-explorer', 'coc-emmet', 'coc-calc', 'coc-tsserver', 'coc-json', 'coc-html', 'coc-json', 'coc-rls']

"Go lang commands
Plug 'stamblerre/gocode', { 'rtp': 'vim', 'do': '~/.config/nvim/plugged/gocode/vim/symlink.sh' }
Plug 'fatih/vim-go' ", { 'do': ':GoUpdateBinaries' } 

" Syntax analysis
Plug 'dense-analysis/ale'

" Markdown
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

" Typescript
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'

call plug#end()
