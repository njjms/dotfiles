""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Basic editing setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on

:set t_Co=256
:set background=dark
:colorscheme industry
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
:imap ( ()<Left>
:imap [ []<Left>
:imap { {}<Left>
:imap " ""<Left>
:imap ' ''<Left>

:vmap <Tab> <Esc>

