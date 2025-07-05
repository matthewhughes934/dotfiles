let mapleader=','

" I want ':E' to always mean ':Explore', and not e.g.
" ':EditQuery'
cabbrev E Explore

nnoremap <F8> :bufdo bd<CR>
nnoremap <C-K> :silent! grep! ''<left>
"nnoremap <C-]> :execute "tjump " . expand("<cword>")<CR>
"nnoremap <C-J> :execute "ptag " . expand("<cword>")<CR>
nnoremap [g :cn<CR>
nnoremap ]g :cp<CR>
" in structured languages, go to next/prev function
nnoremap [f [m[{
nnoremap ]f ]}]m

nnoremap <silent> <C-b> :FzfLua buffers<CR>
