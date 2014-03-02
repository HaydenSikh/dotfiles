set nocompatible
filetype off

" ======= Vim Plugin Bundles =====================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" -------- Core ----------------------------------
Bundle 'tpope/vim-sensible'
Bundle 'bling/vim-airline'

" -------- Navigation ----------------------------
Bundle 'EasyMotion'
Bundle 'camelcasemotion'
Bundle 'The-NERD-tree'
Bundle 'ctrlp.vim'

" -------- Scala support -------------------------
Bundle 'derekwyatt/vim-scala'
Bundle 'derekwyatt/vim-sbt'

" -------- Color schemes -------------------------
Bundle 'molokai'
Bundle 'Solarized'

" -------- Git integration -----------------------
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'

" -------- Other ---------------------------------
Bundle 'myusuf3/numbers.vim'
Bundle 'Syntastic'
Bundle 'Gundo'
Bundle 'majutsushi/tagbar'
Bundle 'css_color.vim'

" ================================================

filetype plugin indent on
syntax on

set fileencodings=utf-8,default,latin1

set autoread " Set to auto read when a file is changed from the outside

set laststatus=2  " Always show the statusbar

set tabstop=4
set softtabstop=4
set shiftwidth=4

set ignorecase
set smartcase

set number

set showmatch

set backup " make backup files
set backupdir=~/.cache/vim/backup " where to put backup files
set directory=~/.cache/vim/swap " directory to place swap files in

" set cursorcolumn " highlight the current column
set cursorline " highlight current line

" Show the powerline symbols
let g:airline_powerline_fonts = 1


" ======= Key bindings ===========================
 "toggle search hilighting with the F3 key
:noremap <F3> :set hlsearch! hlsearch?<CR>
nnoremap <F4> :NERDTreeToggle<CR>
nnoremap <F5> :GundoToggle<CR>

" toggle paste mode via F10
set pastetoggle=<F10>
" ================================================

if has("win32") || has("win16")
	set guifont=DejaVu_Sans_Mono_for_Powerline:h8:cANSI
endif
colorscheme desert

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc
