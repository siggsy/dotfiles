let mapleader=","
set tabstop=4
set listchars=tab:\|\ 
set list

set nocompatible
set termguicolors
set number

" Vim plugins
	call plug#begin('~/.local/share/nvim/plugged')
	Plug 'joshdick/onedark.vim'
	Plug 'sheerun/vim-polyglot'
	Plug 'bling/vim-airline'
	Plug 'voldikss/vim-floaterm'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	call plug#end()

" Colorscheme
	let g:onedark_terminal_italics=1
	let g:onedark_termcolors=16
	colorscheme onedark

" Set to system clipblard
	set clipboard+=unnamedplus
	nnoremap c "_c

" Navigation
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Compile a file using 'compiler' script
	map <leader>c :w! \| !compiler "<c-r>%"<CR>

" Coc settings
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
	nmap <leader>f  <Plug>(coc-format-selected)

	" Trigger completion
	inoremap <silent><expr> <TAB>
		  \ pumvisible() ? "\<C-n>" :
		  \ <SID>check_back_space() ? "\<TAB>" :
		  \ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" P2 Makefile testing
	map <leader>t :w! \| term export name='%:r' && make && make test<CR>
