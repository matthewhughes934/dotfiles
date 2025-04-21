if isdirectory('.git')
    set grepprg=git\ grep\ --no-color\ --line-number\ --column\ $*
    set grepformat=%f:%l:%c:%m
else
    set grepprg=rg\ --vimgrep\ $*
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
