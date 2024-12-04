function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

syntax on
set number
set ruler
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

set nomodeline

autocmd BufWritePre * : call <SID>StripTrailingWhitespaces()

autocmd FileType Makefile setlocal noexpandtab

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
