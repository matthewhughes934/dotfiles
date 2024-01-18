" OVERWRITES
"syn match goImportString
"    \ /^\(\s\+\|import \)\(\h\w* \)\?\zs"[^"]\+"/
"    \ contained
"    \ containedin=goImport

" the only blocks with 'contains=ALLBUT' so need to update these with our custom
" types
syn region goVar
    \ start='var ('
    \ end='^\s*)$'
    \ transparent
    \ fold
    \ contains=ALLBUT,goParen,goBlock,goFunction,goTypeName,goReceiverType,goReceiverVar,goParamName,goParamType,goSimpleParams,goPointerOperator,goCommentCodeBlock,goCommentListMarker

syn region goConst
    \ start='const ('
    \ end='^\s*)$'
    \ transparent
    \ fold
    \ contains=ALLBUT,goParen,goBlock,goFunction,goTypeName,goReceiverType,goReceiverVar,goParamName,goParamType,goSimpleParams,goPointerOperator,goCommentCodeBlock,goCommentListMarker
" END OVERWRITES

" https://go.dev/doc/comment#doclinks
syn match goCommentDocLink
    \ "\s\zs[[a-zA-Z0-9./-]\+\]\ze\([^a-zA-Z]\|$\)"
    \ contained
    \ containedin=goComment,goPackageComment

" https://go.dev/doc/comment#code
" \(\(//\)\|^\)\ matches '//' or start of line (i.e. in a /* */ block)
syn match goCommentCodeBlock
    \ "\(\(//\)\|^\)\zs\t.*"
    \ contained containedin=goComment,goPackageComment

" https://go.dev/doc/comment#lists
" // comments
syn match goCommentListMarker
    \ "\(\(//\)\|^\)\ \{2,\}\zs[*+•-]\ze "
    \ contained
    \ containedin=goComment,goPackageComment

" numbered list
" // comments
syn match goCommentListMarker
    \ "\(\(//\)\|^\) \{2,\}\zs[1-9]\.\ze "
    \ contained
    \ containedin=goComment,goPackageComment


" e.g. //go:build, //go:generate //nolint;
syn match goDirectiveComment "//\S\+:.\{-}\%(\%(//\)\|$\)\@="

hi def link goCommentListMarker String
hi def link goCommentDocLink Float
hi def link goCommentCodeBlock Ignore
hi def link goDirectiveComment SpecialComment
