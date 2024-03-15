set nocompatible

filetype on
syntax on

set fileencodings=utf-8,default,latin1

set autoread " Set to auto read when a file is changed from the outside

set laststatus=2  " Always show the statusbar

set tabstop=4
set softtabstop=4
set shiftwidth=4

set colorcolumn=80,120

set ignorecase
set smartcase

set number

set showmatch

set mouse=a " Enable the mouse in All modes

set backup " make backup files
set backupdir=~/.cache/vim/backup " where to put backup files
set directory=~/.cache/vim/swap " directory to place swap files in

" set cursorcolumn " highlight the current column
set cursorline " highlight current line

" Show the powerline symbols
let g:airline_powerline_fonts = 1

" Configure what is ignored by the CtrlP plugin
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](\.git|target)$'
  \ }

" Default tab handling
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" ======= Key bindings ===========================
let mapleader = ","

 "toggle search hilighting with the F3 key
:noremap <F3> :set hlsearch! hlsearch?<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <F5> :GundoToggle<CR>
nnoremap <leader>gu :GundoToggle<CR>

" EasyAlign bindings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" toggle paste mode via F10
set pastetoggle=<F10>

" -------- Tab navigation ------------------------
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" ================================================


" Load OS-specific config
if !exists("g:os")
  if has("win64") || has("win32") || has("win16")
    let g:os = "Windows"
  else
    let g:os = substitute(system('uname'), '\n', '', '')
  endif
endif

if g:os == "Windows"
  source ~/.vim/win-vimrc
elseif g:os == "Darwin"
  source ~/.vim/mac-vimrc
elseif g:os == "Linux"
  if has("autocmd") && !has("win32unix")
    source ~/.vim/gnome-vimrc
  endif
endif

colorscheme desert

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim/vimrc
