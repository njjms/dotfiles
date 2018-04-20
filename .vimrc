""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Basic editing setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set number relativenumber

set tabstop=4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup vimrcEx
	autocmd!
	autocmd BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\ 	exe "normal g`\"" |
		\ endif
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
	endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()
inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

:map <Left> :echo "no!" <cr>
:map <Right> :echo "no!"<cr>
:map <Up> :echo "no!"<cr>
:map <Down> :echo "no!"<cr>

:imap jj <Esc>l
:imap <c-a> <space><-<space>
:imap <c-p> <space>%>%<space>
:imap uu <CR>

:inoremap ( ()<Left>
:inoremap [ []<Left>
:inoremap { {}<Left>
:inoremap " ""<Left>
:inoremap ' ''<Left>

:nnoremap <c-j> <c-w><c-j>
:nnoremap <c-h> <c-w><c-h>
:nnoremap <c-k> <c-w><c-k>
:nnoremap <c-l> <c-w><c-l>

:vmap <Tab> <Esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()

	Plug 'scrooloose/nerdcommenter'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'bling/vim-bufferline'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'easymotion/vim-easymotion'
	Plug 'nathanaelkane/vim-indent-guides'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_theme='luna'

syntax enable

let g:indent_guides_guide_size=1
let g:indent_guides_color_change_percent=3
let g:indent_guides_enable_on_vim_startup=1

set background=dark
set t_Co=256
let g:solarized_termtrans = 1
let g:solarized_termcolors = 256
colorscheme solarized

hi LineNr ctermfg=208 ctermbg=24
hi Comment ctermfg=94

