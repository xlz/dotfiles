set nocompatible
color tango
syntax on

autocmd FileType python set tabstop=4 shiftwidth=4
autocmd FileType cpp set tabstop=4 shiftwidth=4
autocmd FileType java set tabstop=4 shiftwidth=4

autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

set ignorecase
set smartcase
set hlsearch
noremap <F4> :set hlsearch! hlsearch?<CR>
