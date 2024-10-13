" extension used for testing Go analyzers
" https://pkg.go.dev/golang.org/x/tools/go/analysis/analysistest#RunWithSuggestedFixes
autocmd BufRead,BufNewFile *.go.golden setfiletype go
