" Neoformat
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1

" vim-autoformat
let g:formatdef_rustfmt = '"rustfmt"'
let g:formatters_rust = ['rustfmt']
nmap <Leader>f :Autoformat<CR>

" Local wiki
let g:vimwiki_list = [{'path': '~/.config/nvim/vimwiki/'}]

" Indent guide
let g:indent_guides_enable_on_vim_startup = 1

" UndoTree
" nmap <leader>uu :UndotreeToggle<CR>

" === Remap
" vim-better-whitespace
"   <leader>y - Automatically remove trailing whitespace
nmap <leader>y :StripWhitespace<CR>

" Search shorcuts
"   <leader>h - Find and replace
"   <leader>/ - Claer highlighted search terms while preserving history
map <leader>h :%s///<left><left>
nmap <silent> <leader>/ :nohlsearch<CR>

" Allows you to save files you opened without write permissions via sudo
cmap w!! w !sudo tee %

" Reload icons after init source
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" Justfile support
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au BufNewFile,BufRead justfile setf make
augroup END

" Gitlab review
" https://github.com/omrisarig13/vim-mr-interface "
"" call glaive#Install()
"" let g:gitlab_private_token = '3XRhcahbyAKyyWE-qFHT'

"" nnoremap <unique> <silent> <leader>mc :MRInterfaceAddComment<CR>
"" nnoremap <unique> <silent> <leader>md :MRInterfaceAddGeneralDiscussionThread<CR>
"" nnoremap <unique> <silent> <leader>mC :MRInterfaceAddCodeDiscussionThread<CR>
"" nnoremap <unique> <silent> <leader>mo :MRInterfaceAddCodeDiscussionThreadOnOldCode<CR>
"" nnoremap <unique> <silent> <leader>mn :MRInterfaceAddCodeDiscussionThreadOnNewCode<CR>
"" nnoremap <unique> <silent> <leader>ma :MRInterfaceAddDefaultToCache<CR>

" Skim
" https://github.com/lotabout/skim.vim "
command! -bang -nargs=* Ag call fzf#vim#ag_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))
command! -bang -nargs=* Rg call fzf#vim#rg_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))

" Lightline
" https://github.com/itchyny/lightline.vim "
" https://github.com/mengelbrecht/lightline-bufferline "
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], 
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ }
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

" Echodoc
" https://github.com/Shougo/echodoc.vim "
g:echodoc#enable_at_startup = 1

" CtrlP
" https://github.com/ctrlpvim/ctrlp.vim "
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
endif

" ALE
" https://github.com/dense-analysis/ale "
let g:ale_completion_enabled = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_linters_explicit = 1

" Easymotion
" https://github.com/easymotion/vim-easymotion "

" Gitgutter
hi clear SignColumn