""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Basic editing setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set number relativenumber

set tabstop=4

set wildignore+=*/tmp*,*.so,*.swp,*.zip

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
function! Smart_TabComplete()
	let line = getline('.')

	let substr = strpart(line, -1, col('.'))

	let substr = matchstr(substr, "[^ \t]*$")

	if (strlen(substr)==0)
		return "\<tab>"
	endif
	let has_period = match(substr, '\.') != -1
	let has_slash = match(substr, '\/') != -1
	if (!has_period && !has_slash)
		return "\<C-X>\<C-P>"
	elseif ( has_slash )
		return "\<C-X>\<C-F>"
	else
		return "<C-X>\<C-O>"
	endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>

" function! InsertTabWrapper()
"	let col = col('.') - 1
"	if !col || getline('.')[col - 1] !~ '\k'
"		return "\<tab>"
"	else
"		return "\<c-p>"
"	endif
"endfunction

"inoremap <tab> <c-r>
"inoremap <s-tab> <c-n>

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

:nnoremap <F5> :buffers<CR>:buffer<Space>

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
	Plug '/usr/local/opt/fzf'

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

