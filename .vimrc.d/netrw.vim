function! NetrwGitignoreHide(...)
  let additional_files = a:000

  let default_files = ['.gitignore', '.git/info/exclude']

  " get existing global/system gitignore files
  let global_gitignore = expand(substitute(system("git config --global core.excludesfile"), '\n', '', 'g'))
  if global_gitignore !=# ''
    let default_files = add(default_files, global_gitignore)
  endif
  let system_gitignore = expand(substitute(system("git config --system core.excludesfile"), '\n', '', 'g'))
  if system_gitignore !=# ''
    let default_files = add(default_files, system_gitignore)
  endif

  " append additional files if given as function arguments
  if additional_files !=# []
    let files = extend(default_files, additional_files)
  else
    let files = default_files
  endif

  " keep only existing/readable files
  let gitignore_files = []
  for file in files
    if filereadable(file)
      let gitignore_files = add(gitignore_files, file)
    endif
  endfor

  " get contents of gitignore patterns from those files
  let gitignore_lines = []
  for file in gitignore_files
    for line in readfile(file)
      " filter empty lines and comments
      if line !~# '^#' && line !~# '^$'
        let gitignore_lines = add(gitignore_lines, line)
      endif
    endfor
  endfor

  " convert gitignore patterns to Netrw/Vim regex patterns
  let escaped_lines = []
  for line in gitignore_lines
    let escaped = line
    let escaped = substitute(escaped, '\*\*', '*', 'g')
    let escaped = substitute(escaped, '\.', '\\.', 'g')
    let escaped = substitute(escaped, '\$', '\\$', 'g')
    let escaped = substitute(escaped, '*', '.*', 'g')
    " correction: dot, dollar and asterisks chars shouldn't be escaped when
    " within regex matching groups.
    let escaped = substitute(escaped, '\(\[[^]]*\)\zs\\\.', '\.', 'g')
    let escaped = substitute(escaped, '\(\[[^]]*\)\zs\\\$', '\$', 'g')
    let escaped = substitute(escaped, '\(\[[^]]*\)\zs\.\*', '*', 'g')
    let escaped_lines = add(escaped_lines, escaped)
  endfor

  return join(escaped_lines, ',')
endfunction

let g:netrw_list_hide = NetrwGitignoreHide() . ',\.swp$,\~$,\.orig$'
let g:netrw_hide = 1

let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Per default, netrw leaves unmodified buffers open. This autocommand
" deletes netrw's buffer once it's hidden (using ':q', for example)
autocmd FileType netrw setl bufhidden=delete
