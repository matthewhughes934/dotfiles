" dumping ground for various settings
set splitright
set colorcolumn=0
set autoread

" focus cursor
set scrolloff=10
set cursorline
" disable cursor styling (use terminal emulator cursor)
set guicursor=

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

set signcolumn=yes:1

set noincsearch

set foldmethod=manual

command! -nargs=* T execute 'vertical terminal' '<args>'
