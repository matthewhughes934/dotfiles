if isdirectory('.git')
    setlocal grepprg=git\ grep\ --no-color\ --line-number\ $*
else
    set grepprg=ag\ --vimgrep\ $*
    set grepformat=%f:%l:%c:%m
endif

" open the quickfix window if there's a match
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost grep cwindow
augroup END
