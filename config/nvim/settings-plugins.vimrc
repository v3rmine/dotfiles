" ColorTheme
let g:onedark_terminal_italics = 1
colorscheme onedark

" Local wiki
"" let g:vimwiki_list = [{'path': '~/.config/nvim/vimwiki/'}]

" Indent guide
let g:indent_guides_enable_on_vim_startup = 1

" Skim / FzF
" https://github.com/lotabout/skim.vim "
" https://github.com/junegunn/fzf.vim "
fun! RipgrepFzf(query, fullscreen)
	let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
	let initial_command = printf(command_fmt, shellescape(a:query))
	let reload_command = printf(command_fmt, '{q}')
	let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
	call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfun
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

nmap <leader>l :Lines<cr>
nmap <leader>f :Files<cr>
nmap <leader>r :Rg<cr>

" Context.vim
" https://github.com/wellle/context.vim "
let g:context_enabled = 1

" FastFold
" https://github.com/Konfekt/FastFold "
let g:fastfold_savehook = 1
let g:rust_fold = 1

" Vim-vue
" https://github.com/posva/vim-vue "
let g:vue_pre_processors = []

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
	\ 'component_function': {
	\ 'gitbranch': 'FugitiveHead'
	\ },
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
let g:ctrlp_tabpage_position = 'l'

" Easymotion
" https://github.com/easymotion/vim-easymotion "
nmap s <Plug>(easymotion-s2)
nmap / <Plug>(easymotion-sn)
nmap <N> <Plug>(easymotion-next)
nmap <S-N> <Plug>(easymotion-prev)

" Utilisnips
" https://github.com/SirVer/ultisnips "
let g:UltiSnipsJumpForwardTrigger	= "<c-Left>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-Right>"
let g:UltiSnipsExpandTrigger = "<Nop>"
let g:UltiSnipsRemoveSelectModeMappings = 0
let g:UltiSnipsSnippetDirectories = ['UltiSnips']
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

" Gitgutter
highlight clear SignColumn

" LanguageClient-neovim
" https://github.com/autozimu/LanguageClient-neovim "
let g:LanguageClient_serverCommands = {
	\ 'rust': ['$HOME/.local/bin/rust-analyser'],
	\ 'vue': ['vls'],
	\ 'javascript': ['$HOME/.asdf/shims/javascript-typescript-stdio'],
	\ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
	\ 'python': ['$HOME/.asdf/shims/pyls'],
	\ 'lua.luapad': ['$HOME/.luarocks/bin/lua-lsp'],
	\ 'lua': ['$HOME/.luarocks/bin/lua-lsp'],
	\ 'nim': ['$HOME/.nimble/bin/nimlsp'],
	\ }
""	\ 'vue': ['vls'],
let g:LanguageClient_autoStart = 0
let g:LanguageClient_hasSnippetSupport = 1

" ncm2
" https://github.com/ncm2/ncm2 "
inoremap <c-c> <ESC>
set shortmess+=c
"" autocmd User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
autocmd BufEnter * call ncm2#enable_for_buffer()
inoremap <expr><CR> pumvisible() ? (complete_info().selected == -1 ? "\<C-y>\<CR>" : "\<C-y>") : "\<CR>"
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:float_preview#docked = 0

" ALE
" https://github.com/dense-analysis/ale "
let g:ale_linters_explicit = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

let g:ale_linters = {
	\ 'javascript': ['eslint'],
	\ 'nim': ['nimlsp', 'nimcheck'],
	\ }
let g:ale_fixers = {
	\ '*': ['remove_trailing_lines', 'trim_whitespace'],
	\ 'javascript': ['eslint'],
	\ 'nim': ['nimpretty']
	\ }

highlight ALEErrorSign guifg=Red
highlight ALEWarningSign guifg=Yellow
