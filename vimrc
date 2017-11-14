let mapleader = ","
let maplocalleader = "\\"

execute pathogen#infect()

filetype plugin indent on

set notimeout
set ttimeout
set ttimeoutlen=10

set synmaxcol=800

set backup
set noswapfile

set backupdir=~/vimfiles/tmp/backup/
set undodir=~/vimfiles/tmp/undo/

if !isdirectory(expand(&backupdir))
	call mkdir(expand(&backupdir), "p")
endif

if !isdirectory(expand(&undodir))
	call mkdir(expand(&undodir), "p")
endif

set undofile
set nocompatible
set autoindent
set showmode
set hidden
set ttyfast
set encoding=utf-8
set relativenumber
set scrolloff=3
set nocursorcolumn
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

" CTRL-] is a really bad combination on german keyboards
" Follow tag
nnoremap ü <C-]> 
" Unfollow tag
nnoremap Ü <C-T>

nnoremap ä <C-^>


nnoremap K :q<CR>

" Map search commands to leader s
nnoremap <leader>s :%s/
vnoremap <leader>s :s/

"nnoremap <leader>W :set wrap!<cr>

" Use global movements(broken lines behave slide normal ones
nnoremap j gj
nnoremap k gk

" Clear screen on console mode
if &shell =~ "cmd.exe"
	nnoremap :! :!cls& 
endif

" Map jk to Escape
inoremap jk <esc>

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

" Next error
nnoremap <silent> <F8> :cnext<cr>
nnoremap <silent> <S-F8> :cprev<cr>

" Type make command
nnoremap <leader>m :make -C build 

" Quickfix window
nnoremap <leader>q :call QuickfixToggle()<cr>
let g:quickfix_is_open = 0
function! QuickfixToggle()
	if g:quickfix_is_open
		cclose
		let g:quickfix_is_open = 0
		execute g:quickfix_return_to_window . "wincmd w"
	else
		let g:quickfix_return_to_window = winnr()
		copen
		let g:quickfix_is_open = 1
	endif
endfunction

" Insert empty line
nnoremap <leader>j a<cr><Esc>k$

" p will not copy previous string.
xnoremap p pgvy

"}}}
"
" Basic configuration {{{
" Allow free backspacing
set backspace=indent,eol,start

" Enable wildmenu, when autocompleting filenames
set wildmenu

" Config tabs
set tabstop=4
set shiftwidth=4

" Config statusbar
set laststatus=2 "Always show statusbar
set statusline=
set statusline +=%n\ \|\    "Buffer number
set statusline +=%f\        "File name
set statusline +=%y\        "File type
set statusline +=%=\        " Left align
set statusline +=%{virtcol('.')}: "Cursor column
set statusline +=%l/%L    "CurrentLinenumber / Total linenumber

" Config search
set hlsearch incsearch showmatch
set gdefault
nnoremap / /\v
vnoremap / /\v
set ignorecase smartcase

" Long line handling
set nowrap

" Invisible characters
set list
set listchars=tab:→\ 

" Hightlight lines with over 90 characters.
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%91v.\+/

"}}}

syntax on

augroup filetype_vim
	au!
	au FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_cpp
	au!
	au FileType cpp
	\ setlocal foldmethod=syntax |
	\ normal! zR
augroup END

function! SetPythonOptions()
	setlocal foldmethod=indent
	normal! zr

	if has('win32')
		nnoremap <leader><F5> :w<cr>:!cls&python "%:p"<cr><cr>
	else
		nnoremap <leader><F5> :w<cr>:!clear&&python "%:p"<cr>
	endif
endfunction

augroup filetype_python
	au!
	au FileType python call SetPythonOptions()
augroup END
