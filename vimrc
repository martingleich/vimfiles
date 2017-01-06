let mapleader = ","
let maplocalleader = "\\"

filetype plugin indent on

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

" Mappings {{{
" Map vimrc edit shortcuts.
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap j gj
nnoremap k gk

" Clear screen on console mode
if has('win32')
"	nnoremap :! :!cls& 
endif

" Map jk to Escape
inoremap jk <esc>
inoremap <esc> <nop>

" Map F1 to Escape
inoremap <F1> <esc>
nnoremap <F1> <esc>
vnoremap <F1> <esc>

nnoremap <leader>w <C-w>v<C-w>l
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

" Quickfix window
nnoremap <leader>q :call QuickfixToggle()<cr>
let g:quickfix_is_open = 0
function! QuickfixToggle()
	echom 'Hello'
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


" Line numbers
nnoremap <leader>N :setlocal number!<cr>

" Insert empty line
nnoremap <leader>j a<cr><Esc>k$
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
set wrap

" Invisible characters
set list
set listchars=tab:→\ 

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

	if !exists("g:python_command")
		let g:python_command = "python"
	endif

	if has('win32')
		nnoremap <leader><F5> execute ":w<cr>:!cls&" . g:python_command . "\"%:p\"<cr><cr>"
	endif
endfunction

augroup filetype_python
	au!
	au FileType python call SetPythonOptions()
augroup END
