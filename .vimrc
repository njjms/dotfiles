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
:map - dd
:imap <c-a> <space><-<space>
:imap <c-p> <space>%>%<space>
:imap uu <CR>

:inoremap ( ()<Left>
:inoremap [ []<Left>
:inoremap { {}<Left>
:inoremap " ""<Left>
:inoremap ' ''<Left>

:vmap <Tab> <Esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()

	Plug 'scrooloose/nerdcommenter'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_theme='luna'

syntax enable

set background=dark
let g:solarized_termtrans = 1
let g:solarized_termcolors = 256
colorscheme solarized

hi LineNr ctermfg=94 ctermbg=17
