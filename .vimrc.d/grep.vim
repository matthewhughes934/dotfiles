if isdirectory('.git')
    set grepprg=git\ grep\ --no-color\ --line-number\ $*
else
    set grepprg=ag\ --vimgrep\ $*
    set grepformat=%f:%l:%c:%m
endif
