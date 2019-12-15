color tango
syntax on

autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp,lua,xml,java,javascript set tabstop=2 shiftwidth=2 expandtab

set ignorecase smartcase
set hlsearch
noremap <F4> :set hlsearch! hlsearch?<CR>
let g:EditorConfig_max_line_indicator = "exceeding"
