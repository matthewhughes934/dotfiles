source ~/.vimrc.d/vundle/vundle.vim

filetype plugin on
syntax on
set splitright
set colorcolumn=0
set autoread
set clipboard=unnamedplus

" focus cursor
set scrolloff=10
set cursorline

" line numbers
set relativenumber
set number

" tabs 4 char wide and nice indenting
set expandtab
set smartindent
set autoindent
set shiftwidth=4
set tabstop=4
set textwidth=79
set cindent
set cinkeys-=0#
set indentkeys-=0#

" Spelling settings
set spell spelllang=en_au
set spellfile=$HOME/.vim/spell/en.utf-8.add

" Completion with <tab> (e.g. in commands/filenames)
set wildmode=longest:full,full
set wildmenu

" source local files
for f in split(glob('~/.vimrc.d/*.vim'), '\n')
    exe 'source' f
endfor

" highlighting
set hlsearch
nnoremap <silent> <esc> :nohlsearch<return><esc>
" required to make binding to <esc> work
nnoremap <esc>^[ <esc>^[

" Ensure safe project specific vimrc
set exrc
set secure
