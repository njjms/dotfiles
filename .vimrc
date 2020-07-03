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
set t_ut=""
set cursorline

set nocompatible
set path+=**
set wildmenu

let mapleader=" "

" Mappings

nnoremap <leader>gg :Goyo<CR>
nnoremap <leader>GG :Goyo!<CR>
nnoremap <leader><leader> /<++><CR>df>i

" Plugins

call plug#begin('~/.vim/plugged')

	Plug 'junegunn/seoul256.vim'
	Plug 'junegunn/goyo.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'JuliaEditorSupport/julia-vim'
	Plug 'lervag/vimtex'

call plug#end()

" Airline config

let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" colors

let g:seoul256_background = 233
colo seoul256

set background=light
hi Normal guibg=NONE ctermbg=NONE
hi LineNr ctermfg=NONE ctermbg=NONE

" TeX

let g:vimtex_view_method = 'zathura'

augroup tex
	autocmd!
	autocmd FileType tex,md,Rmd inoremap ;; $$<Esc>i
	autocmd FileType tex,md,Rmd inoremap ;M <CR><CR>$$<CR><CR>$$<Esc>ki
	autocmd FileType tex,md,Rmd inoremap ~~ \sim<Space>

	autocmd FileType tex,md,Rmd inoremap ;th \theta
	autocmd FileType tex,md,Rmd inoremap ;m \mu
	autocmd FileType tex,md,Rmd inoremap ;a \alpha
	autocmd FileType tex,md,Rmd inoremap ;be \beta
	autocmd FileType tex,md,Rmd inoremap ;s \sigma
	autocmd FileType tex,md,Rmd inoremap ;ss \sigma^2
	autocmd FileType tex,md,Rmd inoremap ;S \Sigma
	autocmd FileType tex,md,Rmd inoremap ;la \lambda
	autocmd FileType tex,md,Rmd inoremap ;L \Lambda
	autocmd FileType tex,md,Rmd inoremap ;g \gamma
	autocmd FileType tex,md,Rmd inoremap ;G \Gamma
	autocmd FileType tex,md,Rmd inoremap ;ph \phi
	autocmd FileType tex,md,Rmd inoremap ;pi \pi

	autocmd FileType tex,md,Rmd inoremap ;E E[]<Esc>i
	autocmd FileType tex,md,Rmd inoremap ;c ^

	autocmd FileType tex,md,Rmd inoremap ;h \hat{}<Esc>i
	autocmd FileType tex,md,Rmd inoremap ;ba \bar{}<Esc>i
	autocmd FileType tex,md,Rmd inoremap ;f \frac{}{<++>}<Esc>ba
	autocmd FileType tex,md,Rmd inoremap ;lr \left(\right)<Esc>bba
	autocmd FileType tex,md,Rmd inoremap ;xx X_1,<Space>\ldots<Space>,X_n<Space>
	autocmd FileType tex,md,Rmd inoremap ;si \overset{\text{iid}}{\sim}<Space>
	autocmd FileType tex,md,Rmd inoremap ;yy Y_1,<Space>\ldots<Space>,Y_n<Space>
	autocmd FileType tex,md,Rmd inoremap ;su \sum_{i=<++>}^{<++>}<Space>
	autocmd FileType tex,md,Rmd inoremap ;pr \prod_{i=<++>}^{<++>}<Space>
	autocmd FileType tex,md,Rmd inoremap ;te \text{}<Esc>i
	autocmd FileType tex,md,Rmd inoremap ;ri \rightarrow<Space>\infty<Space>
	autocmd FileType tex,md,Rmd inoremap ;ho H_0:<Space><++>=0\text{ vs. }H_A:<Space><++>\neq<Space>0

	autocmd FileType tex inoremap ;ta \begin{tabular}{<++>}<CR><CR>\end{tabular}<Esc>ki
	autocmd FileType tex inoremap ;ca \begin{cases}<CR><CR>\end{cases}<Esc>ki
	autocmd FileType tex inoremap ;ce \begin{center}<CR><CR>\end{center}<Esc>ki
	autocmd FileType tex inoremap ;al \begin{align*}<CR><CR>\end{align*}<Esc>ki

	autocmd FileType md,Rmd inoremap ;bb ****<Esc>hi
	autocmd FileType md,Rmd inoremap ;ii **<Esc>i
augroup END

" statistics

let g:distOn=0

function! ToggleDist()
	if !g:distOn
		call Dist()
	else
		call DistOff()
	endif
endfunction

function! Dist()
	echo "Distribution shortcuts turned on"
	let g:distOn=1
	inoremap ;no \frac{1}{\sqrt{2\pi\sigma^2}}exp\left( \frac{-(x-\mu)^2}{2\sigma^2} \right)
	inoremap ;po \frac{\lambda^k e^{-\lambda}}{k!}
	inoremap ;bi \choose{n}{k}p^{k}(1-p)^{n-k}
	inoremap ;ex \lambda e^{-\lambda x}
	inoremap ;e1 e^{-x}
	inoremap ;sh \frac{1}{\beta}exp\left(\frac{(x-\alpha)}{\beta}\right)
	inoremap ;ge (1-p)^{k-1}p
	inoremap ;ga \frac{1}{\Gamma(\alpha) \beta^{\alpha}} x^{\alpha - 1} exp\left( -\frac{x}{\beta} \right)
	inoremap ;ch \frac{1}{2^{k/2}\Gamma(k/2)}x^{k/2 - 1}e^{-x/2}
endfunction

function! DistOff()
	echo "Distribution shortcuts turned off"
	let g:distOff=0
	iunmap ;no
	iunmap ;po
	iunmap ;bi
	iunmap ;ex
	iunmap ;ge
	iunmap ;ga
	iunmap ;ch
endfunction

nmap <leader>td :call ToggleDist()<CR>

