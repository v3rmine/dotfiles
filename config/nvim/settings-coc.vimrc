let g:coc_global_extensions = [
      \ 'coc-snippets', 'coc-highlight', 'coc-explorer',
      \ 'coc-emmet', 'coc-calc', 'coc-tsserver',
      \ 'coc-json', 'coc-html', 'coc-json',
      \ 'coc-rls', 'coc-prettier', 'coc-eslint',
      \ 'coc-css', 'coc-python']
", 'coc-elixir']

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" coc.nvim color changes
hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type

" === Remap
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)
