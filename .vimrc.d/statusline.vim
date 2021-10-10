function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction
set statusline=%f\ %{SyntaxItem()}\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)
set laststatus=2
