" Python
"let g:python2_host_prog = '/usr/local/bin/python'
"let g:python3_host_prog = '/usr/local/bin/python3'

" Neoformat
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1

" vim-autoformat
let g:formatdef_rustfmt = '"rustfmt"'
let g:formatters_rust = ['rustfmt']
nmap <Leader>f :Autoformat<CR>

" LSP
let g:LanguageClient_serverCommands = {
\ 'rust': ['rust-analyzer-mac'],
\ }

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
call glaive#Install()

let g:gitlab_private_token = '3XRhcahbyAKyyWE-qFHT'

nnoremap <unique> <silent> <leader>mc :MRInterfaceAddComment<CR>
nnoremap <unique> <silent> <leader>md :MRInterfaceAddGeneralDiscussionThread<CR>
nnoremap <unique> <silent> <leader>mC :MRInterfaceAddCodeDiscussionThread<CR>
nnoremap <unique> <silent> <leader>mo :MRInterfaceAddCodeDiscussionThreadOnOldCode<CR>
nnoremap <unique> <silent> <leader>mn :MRInterfaceAddCodeDiscussionThreadOnNewCode<CR>
nnoremap <unique> <silent> <leader>ma :MRInterfaceAddDefaultToCache<CR>