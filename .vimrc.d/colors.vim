" colors
set t_Co=256
colorscheme zenburn
"set background=dark
" remove most backgrounds
hi LineNr ctermbg=None
hi CursorLine ctermbg=23 ctermfg=None
hi CursorLineNr ctermbg=None
hi SpellLocal ctermbg=None
hi SpellCap ctermbg=None
hi SpellBad ctermbg=None
hi SpellLocal ctermbg=None
hi Error ctermbg=None
" match urxvt background color
hi Normal ctermbg=234
hi Comment ctermbg=None ctermfg=151
hi Identifier ctermbg=None cterm=bold
hi NonText ctermbg=None
hi Constant ctermbg=None
hi Type ctermbg=None

" copying diff colours from dracula
hi DiffChange ctermfg=231 ctermbg=23
hi DiffDelete ctermfg=0 ctermbg=166
hi DiffAdd cterm=bold ctermfg=231 ctermbg=30
" custom diff changes
hi DiffText ctermfg=193 ctermbg=28

" Spell errors should always be visible
hi SpellLocal cterm=underline
hi SpellCap cterm=underline
hi SpellBad cterm=underline

hi Visual ctermbg=94

" Non text colours should not standout
hi NonText ctermbg=None ctermfg=grey
