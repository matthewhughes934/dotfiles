" set `spellfile` according to the `spelllang`
autocmd OptionSet spelllang :call SetSpellFileFromLang()
autocmd BufEnter * :call SetSpellFileFromLang()

function! SetSpellFileFromLang()
    let &l:spellfile='~/.vim/spell/' .
        \ eval('&spelllang') .
        \ '.' .
        \ eval('&encoding') .
        \ '.add'
endfunction
