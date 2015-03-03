" syntax highlighting
syntax on

" tab = 4 columns
set tabstop=4

" use spaces instead of tabs
set expandtab

filetype plugin indent on

" pathogen VIM plugin manager
execute pathogen#infect()

" vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1

