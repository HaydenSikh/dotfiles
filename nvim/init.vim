"╔═══════════════════════════════════════════════════════════════════════════╗
"║ Plugins                                                                   ║
"╚═══════════════════════════════════════════════════════════════════════════╝
call plug#begin()

Plug 'tpope/vim-sensible'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'preservim/vim-indent-guides'
Plug 'folke/twilight.nvim'
Plug 'bling/vim-bufferline'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'scalameta/nvim-metals'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'cloudhead/neovim-fuzzy'
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'thinca/vim-localrc'
Plug 'airblade/vim-gitgutter'

Plug 'junegunn/vim-easy-align'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'mbbill/undotree'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

"┌───────────────────────────────────────────────────────────────────────────┐
"│ Syntax                                                                    │
"└───────────────────────────────────────────────────────────────────────────┘
Plug 'HiPhish/jinja.vim'
Plug 'jvirtanen/vim-hocon'
Plug 'hashivim/vim-terraform'

"┌───────────────────────────────────────────────────────────────────────────┐
"│ Color schemes                                                             │
"└───────────────────────────────────────────────────────────────────────────┘
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'morhetz/gruvbox'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'sainnhe/everforest'
Plug 'tomasr/molokai'

call plug#end()


"╔═══════════════════════════════════════════════════════════════════════════╗
"║ Basic config                                                              ║
"╚═══════════════════════════════════════════════════════════════════════════╝
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set ignorecase
set smartcase

set cursorline " highlight current line
set colorcolumn=80,120
set number

colorscheme desert

set mouse=a


"╔═══════════════════════════════════════════════════════════════════════════╗
"║ Plugin config                                                             ║
"╚═══════════════════════════════════════════════════════════════════════════╝
"┌───────────────────────────────────────────────────────────────────────────┐
"│ Airline                                                                   │
"└───────────────────────────────────────────────────────────────────────────┘
" Show the powerline symbols
let g:airline_powerline_fonts = 1

"┌───────────────────────────────────────────────────────────────────────────┐
"│ CtrlP                                                                     │
"└───────────────────────────────────────────────────────────────────────────┘
" Configure what is ignored by the CtrlP plugin
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](\.git|target)$'
  \ }

"┌───────────────────────────────────────────────────────────────────────────┐
"│ Indent Guides                                                             │
"└───────────────────────────────────────────────────────────────────────────┘
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

"┌───────────────────────────────────────────────────────────────────────────┐
"│ Persistent undo                                                           │
"└───────────────────────────────────────────────────────────────────────────┘
if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif


"╔═══════════════════════════════════════════════════════════════════════════╗
"║ Functions                                                                 ║
"╚═══════════════════════════════════════════════════════════════════════════╝

"╔═══════════════════════════════════════════════════════════════════════════╗
"║ Command bindings                                                          ║
"╚═══════════════════════════════════════════════════════════════════════════╝
" :Bwipeout[!]
" wipe all deleted/unloaded buffers
command! -bar -bang Bwipeout call misc#bwipeout(<bang>0)

" :Bdi
function! DeleteInactiveBufs()
   "From tabpagebuflist() help, get a list of all buffers in all tabs
   let tablist = []
   for i in range(tabpagenr('$'))
       call extend(tablist, tabpagebuflist(i + 1))
   endfor

   "Below originally inspired by Hara Krishna Dara and Keith Roberts
   "http://tech.groups.yahoo.com/group/vim/message/56425
   let nWipeouts = 0
   for i in range(1, bufnr('$'))
       if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
       "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
           silent exec 'bwipeout' i
           let nWipeouts = nWipeouts + 1
       endif
   endfor
   echomsg nWipeouts . ' buffer(s) wiped out'
endfunction
command! Bdi :call DeleteInactiveBufs()

"╔═══════════════════════════════════════════════════════════════════════════╗
"║ Key bindings                                                              ║
"╚═══════════════════════════════════════════════════════════════════════════╝
let mapleader = ","

nnoremap <leader>sv :source $MYVIMRC<CR>

" Use <C-Insert> and <S-Insert> to copy/paste from system clipboard
" these mimic Windows alternatives to C-c and C-v that work from the shell
vnoremap <C-Insert> "+y
noremap! <S-Insert> <C-R><C-O>+

" toggle search match highlighting
nnoremap <leader>hl :set hls!<CR>

"┌───────────────────────────────────────────────────────────────────────────┐
"│ Tab navigation                                                            │
"└───────────────────────────────────────────────────────────────────────────┘
nnoremap <C-S-tab>         :tabprevious<CR>
nnoremap <C-tab>           :tabnext<CR>
nnoremap <leader><C-t>     :tabnew<CR>
inoremap <C-S-tab>         <Esc>:tabprevious<CR>i
inoremap <C-tab>           <Esc>:tabnext<CR>i
inoremap <leader><C-t>     <Esc>:tabnew<CR>

"┌───────────────────────────────────────────────────────────────────────────┐
"│ EasyAlign                                                                 │
"└───────────────────────────────────────────────────────────────────────────┘
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"┌───────────────────────────────────────────────────────────────────────────┐
"│ NERD Tree                                                                 │
"└───────────────────────────────────────────────────────────────────────────┘
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

"┌───────────────────────────────────────────────────────────────────────────┐
"│ UndoTree                                                                  │
"└───────────────────────────────────────────────────────────────────────────┘
nnoremap <leader>un :UndotreeToggle<CR>

"┌───────────────────────────────────────────────────────────────────────────┐
"│ Telescope                                                                 │
"└───────────────────────────────────────────────────────────────────────────┘
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


"╔═══════════════════════════════════════════════════════════════════════════╗
"║ Content-dependant config                                                  ║
"╚═══════════════════════════════════════════════════════════════════════════╝
if has("win32")
  set guifont=FantasqueSansM\ Nerd\ Font\ Mono:h8
elseif has("macunix")
  set guifont=FantasqueSansMono_Nerd_Font_Mono:h9
endif

if exists('g:neovide')
 map <C-=> :let g:neovide_scale_factor = g:neovide_scale_factor + 0.1<CR>
 map <C--> :let g:neovide_scale_factor = g:neovide_scale_factor - 0.1<CR>
 map <C-0> :let g:neovide_scale_factor = 1<CR>

 map <C-ScrollWheelUp> :let g:neovide_scale_factor = g:neovide_scale_factor + 0.1<CR>
 map <C-ScrollWheelDown> :let g:neovide_scale_factor = g:neovide_scale_factor - 0.1<CR>
endif
