color tango
syntax on

autocmd FileType python,cpp,java set tabstop=4 shiftwidth=4
autocmd BufWinLeave ?* exe "normal! i\<esc>H"
autocmd VimEnter ?* if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"ztg`^" | endif

set ignorecase smartcase
set hlsearch
noremap <F4> :set hlsearch! hlsearch?<CR>
