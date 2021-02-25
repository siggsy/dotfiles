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
	Plug 'tpope/vim-fugitive'
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
	vnoremap <leader>c "xy :w!<CR> :term gcc -o '%:r' -std=c99 -Wall -pedantic % && echo "<C-r>x" \| ./'%:r'<CR>
