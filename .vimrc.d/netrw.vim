let g:netrw_list_hide = substitute(
    \substitute(
        \system('git ls-files --other --ignored --exclude-standard --directory'),
        \'\n',
        \',',
        \'g'),
    \',$',
    \'',
    \'') . ',\.swp$,\~$,\.orig$'
let g:netrw_hide = 1

let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Per default, netrw leaves unmodified buffers open. This autocommand
" deletes netrw's buffer once it's hidden (using ':q', for example)
autocmd FileType netrw setl bufhidden=delete
