" ColorTheme
let g:onedark_terminal_italics = 1
colorscheme onedark

" Neoformat
"" let g:neoformat_basic_format_align = 1
"" let g:neoformat_basic_format_retab = 1
"" let g:neoformat_basic_format_trim = 1

" vim-autoformat
"" let g:formatdef_rustfmt = '"rustfmt"'
"" let g:formatters_rust = ['rustfmt']
"" nmap <Leader>f :Autoformat<CR>

" Local wiki
"" let g:vimwiki_list = [{'path': '~/.config/nvim/vimwiki/'}]

" Indent guide
let g:indent_guides_enable_on_vim_startup = 1

" Skim
" https://github.com/lotabout/skim.vim "
command! -bang -nargs=* Ag call fzf#vim#ag_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))
command! -bang -nargs=* Rg call fzf#vim#rg_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))

" Context.vim
" https://github.com/wellle/context.vim "
let g:context_enabled = 1

" FastFold
" https://github.com/Konfekt/FastFold "
let g:fastfold_savehook = 1
let g:rust_fold = 1

" Vim markdown
" https://github.com/plasticboy/vim-markdown "
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 0
let g:vim_markdown_frontmatter = 0
let g:vim_markdown_toml_frontmatter = 0
let g:vim_markdown_json_frontmatter = 0
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_fenced_languages = ['rust=rs', 'c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini']
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" Lightline
" https://github.com/itchyny/lightline.vim "
" https://github.com/mengelbrecht/lightline-bufferline "
let g:lightline = {
  \ 'colorscheme': 'one',
  \ 'active': {
    \ 'left': [
      \ [ 'mode', 'paste' ], 
      \ [ 'gitbranch', 'readonly', 'filename', 'modified' ] 
    \ ],
    \ 'right': [ 
      \ [ 'lineinfo' ],
      \ [ 'percent' ],
      \ [ 'fileformat', 'fileencoding', 'filetype' ] 
    \ ]
  \ },
  \ 'tabline': {
    \ 'left': [ ['buffers'] ],
    \ 'right': [ ['close'] ]
  \ },
  \ 'component_function': {
    \ 'gitbranch': 'FugitiveHead'
  \ },
  \ 'component_expand': {
    \ 'buffers': 'lightline#bufferline#buffers'
  \ },
  \ 'component_type': {
    \ 'buffers': 'tabsel'
  \ }
\ }

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

" CtrlP
" https://github.com/ctrlpvim/ctrlp.vim "
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
endif
nmap <C-P> :CtrlPMixed<cr>
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<C-c>'], 
    \ 'AcceptSelection("t")': ['<cr>'],
    \ 'AcceptSelection("h")': ['<C-h>'],
    \ 'AcceptSelection("v")': ['<C-v>'],
    \ }

" Easymotion
" https://github.com/easymotion/vim-easymotion "

" Gitgutter
highlight clear SignColumn

" LanguageClient-neovim
" https://github.com/autozimu/LanguageClient-neovim "
set hidden
let g:LanguageClient_serverCommands = {
  \ 'rust': ['$HOME/.local/bin/rust-analyser'],
  \ 'vue': ['vls'],
\ }
""  \ 'vue': ['vls'],
let g:LanguageClient_autoStart = 0
let g:LanguageClient_hasSnippetSupport = 1

" ncm2
" https://github.com/ncm2/ncm2 "
" enable ncm2 for all buffers
set shortmess+=c
inoremap <c-c> <ESC>
autocmd BufEnter * call ncm2#enable_for_buffer()
au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" " When the <Enter> key is pressed while the popup menu is visible, it only
" " hides the menu. Use this mapping to close the menu and also start a new
" " line.
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
let g:float_preview#docked = 0

" ALE
" https://github.com/dense-analysis/ale "
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

let g:ale_linters = {
  \ 'javascript': ['eslint'],
\ }
let g:ale_fixers = {
  \ 'javascript': ['eslint'],
\ }