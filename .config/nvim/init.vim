call plug#begin('~/.vim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'raimondi/delimitmate'
Plug 'rakr/vim-one'
Plug 'rhysd/clever-f.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'unblevable/quick-scope'
Plug 'w0rp/ale'

call plug#end()

set tabstop=2 softtabstop=2 shiftwidth=2
set number
set autoindent
set ignorecase
set nowrap
set signcolumn=yes
set mouse=a

let mapleader = ";"

nmap <silent> <BS> :nohlsearch<CR>

nnoremap j gj
nnoremap k gk

nnoremap K kJ

nnoremap <c-j> 3<c-e>
nnoremap <c-k> 3<c-y>

nnoremap <c-h> 3zh
nnoremap <c-l> 3zl

vnoremap > >gv
vnoremap <lt> <lt>gv

vmap <leader>k gc
nmap <leader>k gcc

nnoremap <c-q> :bp\|bd #<CR>

vnoremap  <leader>y  "+y
nnoremap  <leader>y  "+y

nnoremap <c-p> :Files<cr>
nnoremap <c-b> :Buffers<cr>
nnoremap <c-f> :Rg 

let delimitMate_expand_cr = 1
let delimitMate_excluded_regions = ""

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <leader>h :call <SID>show_documentation()<CR>

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'javascript': ['eslint'],
\}

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
  set termguicolors
endif

colorscheme one

