" netrw_gitignore#Hide is too slow https://groups.google.com/g/vim_use/c/xXj6aQtlXlk
" the older alternative can hide too many files, e.g. '_test' pattern in
" .gitignore would cause netrw to hide 'file_test.go'
"let g:netrw_list_hide = netrw_gitignore#Hide() . ',\.swp$,\~$,\.orig$'
let g:netrw_hide = 0

let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Per default, netrw leaves unmodified buffers open. This autocommand
" deletes netrw's buffer once it's hidden (using ':q', for example)
autocmd FileType netrw setl bufhidden=delete
