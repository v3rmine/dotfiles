augroup rust
    fun! RustConfig()
        set ts=2 sw=2 noet
        nmap <M-r> :!cargo run<cr>
        nmap <M-c> :!cargo clippy<cr>
        nmap <M-b> :!cargo build<cr>
        nmap <M-B> :!cargo build --release<cr>
        nmap <M-f> :%! rustfmt --config hard_tabs=true<cr>
    endfun
    au! BufNewFile,BufRead *.rs call RustConfig()
augroup END

augroup vue
    fun! VueConfig()
        set ts=4 sw=4 et
        nmap <M-l> :!yarn lint<cr>
    endfun
    au! BufNewFile,BufRead *.vue set filetype=vue
    au! filetype vue call VueConfig()
augroup END

augroup json
    fun! JsonConfig()
        set ts=2 sw=2 noet
    endfun
    au! BufNewFile,BufRead *.json call JsonConfig()
augroup END

augroup markdown
    fun! MardownConfig()
        :Limelight
        :Goyo
    endfun
    " https://github.com/junegunn/goyo.vim/issues/207 "
    au! WinEnter,BufEnter *.md call MardownConfig()
augroup END

augroup vimrc
    fun! VimrcConfig()
        set ts=2 sw=2 noet
        nmap <C-r> :source $MYVIMRC<cr>
    endfun
    au! WinEnter,BufEnter *.vimrc call VimrcConfig()
augroup END
