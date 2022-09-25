let g:ctrlp_max_files=0 
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_user_command = [
    \ '.git',
    \ 'cd %s && git ls-files --cached --others --exclude-standard',
    \ 'find %s -type f'
    \ ]
