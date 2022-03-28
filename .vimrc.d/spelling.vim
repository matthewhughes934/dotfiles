" When `spelllang` is empty, Vim picks a `spellfile` for us
" Since I just want to use the default spellfile(s) make sure we keep this
" empty, even after having written something to it
autocmd OptionSet spelllang :set spellfile=
autocmd BufEnter * :set spellfile=
