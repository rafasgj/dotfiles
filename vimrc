syntax on
set number
set ruler
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

set nomodeline

autocmd FileType Makefile setlocal noexpandtab

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
