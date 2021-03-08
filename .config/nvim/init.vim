let mapleader=","

set expandtab
set shiftwidth=4
set tabstop=4

set listchars=eol:↴,tab:\|\ 
"map <leader>n :set listchars=tab:\\|\ <CR>
"map <leader>N :set listchars=eol:↴,tab:\\|\ <CR>
set list

set nocompatible
set termguicolors
set number

augroup templates
	autocmd BufNewFile *.c 0r ~/.config/nvim/templates/skeleton.c
	autocmd BufNewFile *.tex 0r ~/.config/nvim/templates/skeleton.tex
augroup end


" Vim plugins
	call plug#begin('~/.local/share/nvim/plugged')
	Plug 'joshdick/onedark.vim'
	Plug 'morhetz/gruvbox'
	Plug 'sheerun/vim-polyglot'
	Plug 'bling/vim-airline'
	Plug 'voldikss/vim-floaterm'
	Plug 'tpope/vim-fugitive'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	call plug#end()

" Colorscheme

	let g:gruvbox_italic = 1
	let g:gruvbox_contrast_dark = 'hard'
	let g:onedark_terminal_italics=1
	let g:onedark_termcolors=16
	colorscheme gruvbox

" Set to system clipblard
	set clipboard+=unnamedplus
	nnoremap c "_c

" Navigation
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Compile a file using 'compiler' script
	nnoremap <leader>c :w! \| term compiler "<c-r>%"<CR>

" Coc settings
	set signcolumn=yes
	nnoremap <silent> K :call <SID>show_documentation()<CR>
	function! s:show_documentation()
	  if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	  elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	  else
		execute '!' . &keywordprg . " " . expand('<cword>')
	  endif
	endfunction

	nmap <leader>rn <Plug>(coc-rename)
	xmap <leader>f  <Plug>(coc-format-selected)
	nmap <leader>f  <Plug>(coc-format-selected)

	" TAB completion
	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
	endfunction

	inoremap <silent><expr> <Tab>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<Tab>" :
		\ coc#refresh()
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	
	" Code action and quickfix
	nmap <leader>ac <Plug>(coc-codeaction)
	nmap <leader>qf <Plug>(coc-fix-current)
	nmap <silent> [g <Plug>(coc-diagnostic-prev)
	nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Vim-fugitive config
	nmap <leader>gs :G<CR>
	nmap <leader>gj :diffget //2<CR>
	nmap <leader>gf :diffget //3<CR>

" Clear search results
	 noremap <silent> <leader>/ :let @/ = ""<CR>

" P2 Makefile testing
	map <leader>t :w! \| term export name='%:r' && make && make test<CR>
	map <leader>T :w! \| term vmtest '%:r' '%:p:h'<CR>
	nnoremap <leader>C :w!<CR>
				\/\/\/ in:<CR>
				\<C-v>%hd$viB"iyu
				\/\/\/ out:<CR>
				\<C-v>%hd$viB"oyu
				\:let @/ = ""<CR>
				\:term gcc -o '%:r' -std=c99 -Wall -pedantic -lm % &&
				\diff -u <(echo "<c-r>i" \| tr -d '\r' \| ./'%:r') <(echo "<c-r>o" \| tr -d '\r') && echo "\033[1;32mok\033[0;38m"<CR><CR>
