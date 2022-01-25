if isdirectory('.git')
    set grepprg=git\ grep\ --no-color\ --line-number\ $*
else
    set grepprg=ag\ --vimgrep\ $*
    set grepformat=%f:%l:%c:%m
endif

augroup quickfix
    autocmd!
    " open the quickfix window if there's a match
    autocmd QuickFixCmdPost grep cwindow
    autocmd QuickFixCmdPost grep redraw!
augroup END
