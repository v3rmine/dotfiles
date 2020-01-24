" Python
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Neoformat
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1

" Local wiki
let g:vimwiki_list = [{'path': '~/.config/nvim/vimwiki/'}]

" Indent guide
let g:indent_guides_enable_on_vim_startup = 1

" Explorer
nmap ge :CocCommand explorer<CR>

" UndoTree
nmap <leader>uu :UndotreeToggle<CR>

" Echodoc
let g:echodoc#enable_at_startup = 1

" vim-javascript
" Enable syntax highlighting for JSDoc
let g:javascript_plugin_jsdoc = 1

" vim-jsx
" Highlight jsx syntax even in non .jsx files
let g:jsx_ext_required = 0

" javascript-libraries-syntax
let g:used_javascript_libs = 'underscore,requirejs,chai,jquery'

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

" vim-jsdoc shortcuts
" Generate jsdoc for function under cursor
nmap <leader>z :JsDoc<CR>

" === Misc
" ignore case when searching
set ignorecase

" if the search string has an upper case letter in it, the search will be case sensitive
set smartcase

" Automatically re-read file if a change was detected outside of vim
set autoread

" Reload icons after init source
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif