set nocompatible

" Initialize and register Plug plugins
call plug#begin()

Plug 'dense-analysis/ale'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mzlogin/vim-markdown-toc'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

colorscheme dracula " dracula plugin
set backspace=2     " start, indent
set cmdheight=2     " give more space for displaying messages
set encoding=utf-8  " sane default
set expandtab       " expand tabs to spaces
set number          " show line numbers
set scrolloff=8     " auto-scroll margin
set shiftwidth=2    " number of spaces when shift indenting
set smartindent     " auto-indent
set softtabstop=2   " number of spaces in tab when editing
set tabstop=2       " number of visual spaces per tab
set termguicolors   " enable true colors support
set updatetime=300  " decrease updatetime, speedier refresh
syntax on           " enable syntax highlighting

let mapleader = " "
" project view in vertical split
nnoremap <leader>pv :Vex<CR> 
" source .vimrc
nnoremap <leader><CR>  :so ~/.vimrc<CR>
" fuzzy find git files
nnoremap <C-p> :GFiles<CR>
" fuzzy find project files
nnoremap <leader>pf :Files<CR>

" ALE plugin configuration
let b:ale_fixers = ['eslint', 'prettier']
let b:ale_fix_on_save = 1 " enable format/fix on save

" vim-easy-align plugin mappings

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
