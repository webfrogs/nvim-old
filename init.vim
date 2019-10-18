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

" terminal settings
nnoremap <leader>t :set splitbelow<CR>:split<CR>:terminal<CR>
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>

" window switch
nnoremap <LEADER>w <C-w>w
nnoremap <LEADER>h <C-w>h
nnoremap <LEADER>j <C-w>j
nnoremap <LEADER>k <C-w>k
nnoremap <LEADER>l <C-w>l

" ===
" === Vim-plug setting
" ===
call plug#begin('~/.config/nvim/plugged')
Plug 'liuchengxu/eleline.vim'
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

" eleline setting
let g:airline_powerline_fonts = 1
