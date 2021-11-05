source ~/.vimrc.d/vundle/vundle.vim

filetype plugin on
set completeopt-=preview

" focus cursor
set scrolloff=10
set cursorline
" line numbers
set relativenumber
set number
" tabs 4 char wide and nice indenting
set expandtab
set smartindent
set cindent
set cinkeys-=0#
set indentkeys-=0#
set autoindent
set shiftwidth=4
set tabstop=4
set textwidth=79

set splitright

syntax on
set colorcolumn=0

" Spelling settings
set spell spelllang=en_au
set spellfile=$HOME/.vim/spell/en.utf-8.add

" status line changes
function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction
set statusline=%f\ %{SyntaxItem()}\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)
set laststatus=2

" ##### Commands
command! Browse :vnew +setl\ buftype=nofile | 0put =v:oldfiles | nnoremap <buffer> <CR> :e <C-r>=getline('.')<CR><CR>

set autoread

" Completion with <tab> (e.g. in commands/filenames)
set wildmode=longest,list,full
set wildmenu

" misc
let g:loaded_logipat = 1
filetype indent plugin on

" source local files
for f in split(glob('~/.vimrc.d/*.vim'), '\n')
    exe 'source' f
endfor

set hlsearch
nnoremap <silent> <esc> :noh<return><esc>
" required to make binding to <esc> work
nnoremap <esc>^[ <esc>^[

" Ensure safe project specific vimrc
set exrc
set secure
