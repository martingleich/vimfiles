let mapleader = ","
let maplocalleader = "\\"

set notimeout
set ttimeout
set ttimeoutlen=10

set autoindent
set scrolloff=3
set nocursorline

" Disable shortcuts for ex mode
" I never use them and just hit them accidentally.
nnoremap Q <nop>

" Enable powershell as shell
"set shell=powershell
"set shellcmdflag=-command

" Mappings {{{
" Map vimrc edit shortcuts.
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap - ;
nnoremap _ ,

" CTRL-] is a really bad combination on german keyboards
" Follow tag
nnoremap ü <C-]> 
" Unfollow tag
nnoremap Ü <C-T>
" Edit alternate file
nnoremap ä <C-^>

nnoremap K :q<CR>

" Map subsititue commands to leader s
nnoremap <leader>s :%s/
vnoremap <leader>s :s/

"nnoremap <leader>W :set wrap!<cr>

" Use global movements(broken lines behave like normal ones)
nnoremap j gj
nnoremap k gk

" Clear screen on console mode
if &shell =~ "cmd.exe"
	nnoremap :! :!cls& 
endif

" Map jk to Escape
inoremap jk <esc>

" Save with s
nnoremap s :w<cr>

" Make vertical split of current window
nnoremap <leader>w <C-w>v<C-w>l

" Make through windows with Ctrl + movement key
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Tab navigation
nnoremap <silent> <F8> gT
nnoremap <silent> <F9> gt

" Clear search highlights
nnoremap <silent> <Space> :noh<cr>

" Insert empty line
nnoremap <leader>j a<cr><Esc>k$

" p will not yank overwritten string.
xnoremap p pgvy

"}}}
"
" Basic configuration {{{
" Allow free backspacing
set backspace=indent,eol,start

" Config tabs
set tabstop=4
set shiftwidth=4

" Config search
set gdefault
"nnoremap / /\v
"vnoremap / /\v
set ignorecase smartcase

" Long line handling
set nowrap

" Invisible characters
set list
