function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction
set statusline=%{substitute(getcwd(),$HOME,'~','')}\ %f\ %=\ %{SyntaxItem()}\ %=\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)
set laststatus=2

hi StatusLine     term=bold,reverse ctermfg=16 ctermbg=110 guifg=#000000 guibg=#afaf87
hi StatusLineNC   term=reverse ctermfg=241 ctermbg=248  guifg=#666666 guibg=#afaf87
