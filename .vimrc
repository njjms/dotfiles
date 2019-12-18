"  __   __   __     __    __     ______     ______   
"  /\ \ / /  /\ \   /\ "-./  \   /\  == \   /\  ___\ 
"  \ \ \'/   \ \ \  \ \ \-./\ \  \ \  __<   \ \ \___
"   \ \__|    \ \_\  \ \_\ \ \_\  \ \_\ \_\  \ \_____\
"    \/_/      \/_/   \/_/  \/_/   \/_/ /_/   \/_____/

syntax enable
set relativenumber number
set tabstop=4
set shiftwidth=4
set numberwidth=4

set nocompatible
set path+=**
set wildmenu

" Mappings

nnoremap YO :Goyo<CR>
nnoremap NO :Goyo!<CR>
nnoremap % v%
vnoremap <Tab> <Esc>

" Plugins

call plug#begin('~/.vim/plugged')

	Plug 'junegunn/seoul256.vim'
	Plug 'junegunn/goyo.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'JuliaEditorSupport/julia-vim'

call plug#end()

" Airline config

let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" colors

let g:seoul256_background = 233
colo seoul256

set background=light