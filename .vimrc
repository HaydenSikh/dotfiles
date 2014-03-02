execute pathogen#infect()

syntax on
filetype plugin indent on

let g:airline_powerline_fonts = 1
set laststatus=2

set tabstop=4
set softtabstop=4
set shiftwidth=4

set guifont=DejaVu_Sans_Mono_for_Powerline:h8:cANSI
colors desert

set lines=40
set columns=120

set ignorecase
set number
set smartcase

set autochdir " always switch to the current file directory 

set backup " make backup files
set backupdir=~/.vim/backup " where to put backup files
set directory=~/.vim/tmp " directory to place swap files in

" set cursorcolumn " highlight the current column
set cursorline " highlight current line

 "toggle search hilighting with the F3 key
:noremap <F3> :set hlsearch! hlsearch?<CR>
nnoremap <F4> :NumbersToggle<CR>

set showmatch

set autoread " Set to auto read when a file is changed from the outside

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

set fileencodings=utf-8,default,latin1

