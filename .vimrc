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

autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>

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
" Standard Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

":map <Left> :echo "no!" <cr>
":map <Right> :echo "no!"<cr>
":map <Up> :echo "no!"<cr>
":map <Down> :echo "no!"<cr>

:imap jj <Esc>l
":imap <c-a> <space><-<space>
":imap <c-p> <space>%>%<space>
":imap uu <CR>

:nnoremap ; :
:nnoremap : ;
:nnoremap ffz :FZF<CR>
:nnoremap ffd :FZF<space>~/
:nnoremap pwd :!pwd<CR>
:nnoremap BB :Buffers<CR>
":nnoremap ert :vs<bar>b

:inoremap ( ()<Left>
:inoremap [ []<Left>
:inoremap { {}<Left>
:inoremap " ""<Left>
:inoremap ' ''<Left>

:vmap <Tab> <Esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Split Navigation Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

:nnoremap SS <c-w>k
:nnoremap AA <c-w>h
:nnoremap DD <c-w>j
:nnoremap FF <c-w>l

":nnoremap <c-J> <c-w>J
:nnoremap <c-h> :bp<CR>
":nnoremap <c-K> <c-w>K
:nnoremap <c-l> :bn<CR>

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
	Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --bin'}
	Plug 'junegunn/fzf.vim'
	Plug 'yuttie/comfortable-motion.vim'
	Plug 'vimwiki/vimwiki'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_theme='luna'

set nocompatible
filetype plugin on
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
hi Visual ctermfg=208 ctermbg=24

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Mange whitespace!
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set listchars=tab:>~,nbsp:_,trail:.
set list

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Indicate lines over 80 chars
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

