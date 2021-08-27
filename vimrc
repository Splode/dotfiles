set nocompatible

" Initialize and register Plug plugins
call plug#begin()

Plug 'dense-analysis/ale'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mzlogin/vim-markdown-toc'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

colorscheme dracula " dracula plugin
set autoindent      " indent according to previous line
set backspace=2     " start, indent
set cmdheight=2     " give more space for displaying messages
set expandtab       " expand tabs to spaces
set hidden          " switch between buffers without having to save first
set number          " show line numbers
set report=0        " report changed lines
set scrolloff=8     " auto-scroll margin
set shiftwidth=2    " number of spaces when shift indenting
set smartindent     " auto-indent
set softtabstop=2   " number of spaces in tab when editing
set tabstop=2       " number of visual spaces per tab
set termguicolors   " enable true colors support
set ttyfast         " faster redrawing
set updatetime=300  " decrease updatetime, speedier refresh
syntax on           " enable syntax highlighting

" smarter cursorline: toggle off when entering insert mode
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

" enable limelight in conjunction with Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let mapleader = " "
" project view in vertical split
nnoremap <leader>pv :Vex<CR> 
" source .vimrc
nnoremap <leader><CR>  :so ~/.vimrc<CR>
" fuzzy find git files
nnoremap <C-p> :GFiles<CR>
" fuzzy find project files
nnoremap <leader>pf :Files<CR>
" format current file
nnoremap <leader>ff :ALEFix<CR>

" yank to system clipboard in normal mode
nnoremap <leader>y "+y
" yank to system clipboard in visual mode
vnoremap <leader>y "+y
" yank entire file contents to system clipboard
nnoremap <leader>Y gg"+yG

" move current line up or down
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" ALE plugin configuration
let b:ale_fixers = ['eslint', 'prettier']
let b:ale_fix_on_save = 1 " enable format/fix on save

" vim-easy-align plugin mappings

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" use git-bash on Windows to enable previews for plugins like fzf, ripgrep
if has('win32')
  let $PATH = 'C:\Users\Christopher\scoop\apps\git\current\usr\bin;' . $PATH
endif

" SourceIfExists sources a file only if file exists {
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction
" }

" source coc.vim settings, if present
call SourceIfExists("~/.coc.vim")
