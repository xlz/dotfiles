set background=dark

hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "tango"

" Default Colors
hi NonText      ctermfg=darkgray

" Search
hi Search       cterm=none ctermfg=white ctermbg=darkgreen
hi IncSearch    cterm=none ctermfg=blue ctermbg=white

" Window Elements
hi StatusLine   ctermfg=white ctermbg=darkgreen cterm=bold
hi StatusLineNC ctermfg=gray ctermbg=darkgreen
hi Folded       ctermfg=white ctermbg=darkmagenta
hi Visual       ctermbg=darkgreen ctermfg=gray cterm=reverse

" Specials
hi Todo         ctermfg=white ctermbg=darkgreen
hi Title        ctermfg=white cterm=bold

" Syntax
hi Constant     ctermfg=3
hi Number       ctermfg=3
hi Statement    ctermfg=White cterm=bold
hi Identifier   ctermfg=Blue cterm=none 
hi PreProc      ctermfg=Magenta cterm=none
hi Comment      ctermfg=darkcyan cterm=none
hi Type         ctermfg=Green cterm=bold
hi Special      ctermfg=darkmagenta cterm=none
hi Error        ctermfg=white ctermbg=DarkRed cterm=bold
hi MatchParen   ctermfg=white ctermbg=gray cterm=bold

" Diff
hi DiffAdd      ctermfg=yellow cterm=none
hi DiffChange   ctermfg=Magenta cterm=none
hi DiffDelete   ctermfg=Blue cterm=none
hi DiffText     ctermfg=Green cterm=none
