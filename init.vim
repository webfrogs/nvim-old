" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===
" === Editor Setup
" ===
let mapleader = "\<Space>"

set number
set relativenumber
set cursorline
set autoindent
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

nnoremap <leader>t :set splitbelow<CR>:split<CR>:terminal<CR>
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>:q<CR>

" ===
" === Vim-plug setting
" ===
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" ===
" === Plugin setting
" ===
" Nerdtree config
nmap tt :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
