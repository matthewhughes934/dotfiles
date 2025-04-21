filetype plugin on

for f in split(glob(expand('<sfile>:p:h').'/init.d/*.vim'), "\n")
    exe 'source' f
endfor

for f in split(glob(expand('<sfile>:p:h').'/init.d/*.lua'), "\n")
    exe 'source' f
endfor
