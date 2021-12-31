" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	"silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
	"			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    !rm -rf ~/.config/nvim/tmp && mkdir ~/.config/nvim/tmp
                \ && git clone https://github.com/junegunn/vim-plug.git ~/.config/nvim/tmp
                \ && mkdir ~/.config/nvim/autoload && cp ~/.config/nvim/tmp/plug.vim ~/.config/nvim/autoload
                \ && rm -rf ~/.config/nvim/tmp

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
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
filetype plugin on

" hotkeys
nnoremap <LEADER>1 :noh<CR>
inoremap jk <Esc>

" use system clipboard
" set clipboard+=unnamedplus
nnoremap <LEADER>y "+y
nnoremap <LEADER>p "+p

" copy current file and cursor line to clipboard
nnoremap <LEADER>d :let @+ = expand("%") . ":" . line(".")<CR>


" terminal settings
let g:neoterm_autoscroll = 1
nnoremap <LEADER>wt :set splitbelow<CR>:split<CR>:res 10<CR>:terminal<CR>
autocmd TermOpen term://* startinsert | setlocal nonumber norelativenumber | setlocal signcolumn=no
tnoremap <C-[> <C-\><C-N>
tnoremap <C-q> <C-\><C-N>:q<CR>
nnoremap <LEADER>ot :terminal<CR>

" window switch
" nnoremap <LEADER>ww <C-w>w
" nnoremap <LEADER>wn <C-w>n
" nnoremap <LEADER>h <C-w>h
" nnoremap <LEADER>j <C-w>j
" nnoremap <LEADER>k <C-w>k
" nnoremap <LEADER>l <C-w>l
" nnoremap <LEADER>m <C-w>_
nnoremap <LEADER>n :res 10<CR>
" nnoremap <LEADER>q <C-w>q

" tab switch
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>
nnoremap <LEADER>tn :tabnew<CR>


" ===
" === Vim-plug setting
" ===
call plug#begin('~/.config/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" toml support
Plug 'cespare/vim-toml'

" Color scheme
Plug 'drewtempelmeyer/palenight.vim'

" Editor Enhancement
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'

" Dockerfile
Plug 'ekalinin/Dockerfile.vim'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Golang
Plug 'fatih/vim-go'

" Markdown
Plug 'godlygeek/tabular' " needed by vim-markdown plugin
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }


call plug#end()

" ===
" === Color scheme setting
" ===
set background=dark
colorscheme palenight

" ===
" === nerdcommenter plugin setting
" ===
let g:NERDSpaceDelims = 1

" ===
" === fzf plugin setting
" ===
function! RGSearch(filename)
	let command_fmt = 'rg --with-filename --column --line-number' 
		\ . ' --no-heading --color=always --smart-case -- %s ' 
		\ . a:filename . ' || true'
    let initial_command = printf(command_fmt, shellescape(''))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', '', '--bind', 
		\ 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), 0)
endfunction

" search files
nnoremap <leader>sf :Files<CR>
" search content in project
nnoremap <leader>sp :call RGSearch('')<CR>
" search content in current file
nnoremap <leader>sc :call RGSearch(fnameescape(expand('%')))<CR>
" search buffer
nnoremap <leader>sb :Buffers<CR>

" ===
" === Nerdtree plugin setting
" ===
nmap tt :NERDTreeToggle<CR>:setlocal signcolumn=no<CR>
let NERDTreeShowHidden=1
" Start NERDTree and leave the cursor in it.
"autocmd VimEnter * NERDTree

" Check if NERDTree is open or active
function IsNERDTreeOpen()
    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind if NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function SyncTree()
    if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
        NERDTreeFind
        wincmd p
    endif
endfunction

" Highlight currently open buffer in NERDTree
nmap <Leader>ob :call SyncTree()<CR>

" ===
" === markdown plugins setting
" ===
let g:vim_markdown_folding_disabled = 1

" ===
" === vim-go plugin setting
" ===

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
let g:go_fmt_command = "goimports"

" ===
" === coc plugin setting
" ===
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-snippets',
  \ 'coc-lua',
  \ 'coc-vimlsp']


" coc snippet settings
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
let g:snips_author = 'Carl Chen'


" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'filename': 'LightlineFilename',
      \ },
      \ }
" Use auocmd to force lightline update.
" autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

function! TermRunning(buf)
    return getbufvar(a:buf, '&buftype') !=# 'terminal' ? 0 :
        \ has('terminal') ? term_getstatus(a:buf) =~# 'running' :
        \ has('nvim') ? jobwait([getbufvar(a:buf, '&channel')], 0)[0] == -1 :
        \ 0
endfunction

" Using CocList
" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

