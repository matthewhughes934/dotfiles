" open the quickfix window if there's something to show
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost grep\|make bot copen
    autocmd QuickFixCmdPost grep\|make redraw!
augroup END
