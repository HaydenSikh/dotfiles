" ===== Plugins ==============================================================
call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'preservim/vim-indent-guides'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'scalameta/nvim-metals'
" Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'cloudhead/neovim-fuzzy'
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'junegunn/vim-easy-align'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'mbbill/undotree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

" Syntax
" Plug 'derekwyatt/vim-scala'
Plug 'HiPhish/jinja.vim'
Plug 'jvirtanen/vim-hocon'
Plug 'hashivim/vim-terraform'

" Color schemes
Plug 'morhetz/gruvbox'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

call plug#end()


set tabstop=4
set softtabstop=4
set shiftwidth=4

set ignorecase
set smartcase

set cursorline " highlight current line
set colorcolumn=80,120

colorscheme desert

set mouse=a


" === Plugin config ==========================================================

" --- Airline ----------------------------------------------------------------
" Show the powerline symbols
let g:airline_powerline_fonts = 1

" --- CtrlP ------------------------------------------------------------------
" Configure what is ignored by the CtrlP plugin
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](\.git|target)$'
  \ }

" --- Indent Guiges ----------------------------------------------------------
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" --- Persistent undo --------------------------------------------------------
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



" === Key bindings ===========================================================
let mapleader = ","

nnoremap <leader>sv :source $MYVIMRC<CR>

" Use <C-Insert> and <S-Insert> to copy/paste from system clipboard
vnoremap <C-Insert> "+y
noremap! <S-Insert> <C-R><C-O>+

" -------- Tab navigation ----------------------------------------------------
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" --- EasyAlign --------------------------------------------------------------
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" --- NerdTree ---------------------------------------------------------------
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" --- UndoTree ---------------------------------------------------------------
nnoremap <leader>un :UndotreeToggle<CR>

" --- Telescope --------------------------------------------------------------
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" === Context-dependant Config ===============================================
if has("win32")
    set guifont=FantasqueSansM\ Nerd\ Font\ Mono:h8
elseif has("macunix")
    set guifont=FantasqueSansMono_Nerd_Font_Mono:h9
endif
