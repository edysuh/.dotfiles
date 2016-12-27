" edys's neovim config file --------------------------------------------------
" date_created: Sept 15, 2016

" dein scripts ---------------------------------------------------------------

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

" ---- dein begin ----
call dein#begin('~/.vim/dein/')
call dein#add('shougo/dein.vim')

" general vim as an ide plugins
call dein#add('airblade/vim-gitgutter')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('dyng/ctrlsf.vim')
call dein#add('neomake/neomake')
call dein#add('raimondi/delimitmate')
call dein#add('scrooloose/nerdtree')
call dein#add('shougo/deoplete.nvim')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-surround')
call dein#add('xolox/vim-misc')
call dein#add('xolox/vim-session')

" themes
call dein#add('freeo/vim-kalisi')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

" language specific plugins
call dein#add('pangloss/vim-javascript')
call dein#add('carlitux/deoplete-ternjs')

call dein#end()
" ---- dein end ----

filetype plugin indent on
syntax enable

" general configurations -----------------------------------------------------

set tabstop=2						" number of visual spaces per TAB
set softtabstop=2				" number of spaces in tab when editing
set shiftwidth=2
" set expandtab					" tabs are spaces

set number              " show line numbers
set showcmd             " show command in bottom bar
set showmatch           " highlight matching [{()}]
set hlsearch

set ignorecase					" case-insensitive search, except when using capital letters
set smartcase

set autoindent
set laststatus=2
set confirm
set hidden

" custom mappings ------------------------------------------------------------

let mapleader = "\<space>"

" reload .config/nvim/init.vim
nnoremap <Leader>r :source $HOME/.config/nvim/init.vim<CR>

nnoremap j gj
nnoremap k gk

nnoremap K kJ						" use K to join line above, similar to J

nnoremap <c-e> 4<c-e>		" scroll three lines with ctrl-e and ctrl-y
nnoremap <c-y> 4<c-y>

vnoremap > >gv					" Do not loose the current selection when shift indentation
vnoremap <lt> <lt>gv

" remap commentary
vmap <leader>k gc
nmap <leader>k gcc

" fixes displeasing indentation behavior when leaving an empty indented line
" inoremap <CR> <CR>x<BS>
nnoremap o ox<BS>
nnoremap O Ox<BS>

nmap <silent> <BS> :nohlsearch<CR>

" same screen buffer focus 
nnoremap <c-j> <C-W>j
nnoremap <c-k> <C-W>k
nnoremap <c-h> <C-W>h
nnoremap <c-l> <C-W>l

" map different tab widths to leader
nnoremap <Leader>2 :set expandtab tabstop=2 softtabstop=2 shiftwidth=2<CR>
nnoremap <Leader>4 :set expandtab tabstop=4 softtabstop=4 shiftwidth=4<CR>
nnoremap <Leader>8 :set expandtab tabstop=8 softtabstop=8 shiftwidth=8<CR>

" clipboard
nmap <leader>p :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
" imap <leader>p <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nmap <leader>y :.w !pbcopy<CR><CR>
vmap <leader>y :w !pbcopy<CR><CR>

" spell mode
map <F12> :set spell!<Bar>set spell?<CR>

" new tab and tab navigation
nnoremap <Leader>t :tabnew<CR>
nnoremap <leader>n :tabprevious<CR>
nnoremap <leader>b :tabnext<CR>

" buffer navigation
nnoremap <c-b> :bprevious<CR>
nnoremap <c-n> :bnext<CR> 
nnoremap <c-q> :bd<CR>

" vim-session
nnoremap <leader>s :SaveSession 
nnoremap <leader>o :OpenSession 

" nerdtree toggle
nnoremap <leader>d :NERDTreeToggle<CR>

" ctrlsf
nmap     <leader>f <Plug>CtrlSFPrompt
vmap     <leader>f <Plug>CtrlSFVwordPath
nmap     <leader>F <Plug>CtrlSFCwordPath
nmap     <leader>g <Plug>CtrlSFQuickfixPrompt
vmap     <leader>g <Plug>CtrlSFQuickfixVwordPath
vmap     <leader>G <Plug>CtrlSFQuickfixVwordExec
nnoremap <leader>v :CtrlSFToggle<CR>

" neovim terminal escape
tnoremap \<Esc> <C-\><C-n>

" terminal buffer movement
tnoremap <c-j> <C-\><C-n><C-W>j
tnoremap <c-k> <C-\><C-n><C-W>k
tnoremap <c-h> <C-\><C-n><C-W>h
tnoremap <c-l> <C-\><C-n><C-W>l

" buffer navigation
tnoremap <c-b> <C-\><C-n>:bprevious<CR>
tnoremap <c-n> <C-\><C-n>:bnext<CR>
tnoremap <c-q> <C-\><C-n>:bd<CR>

" take word under cursor and console.log in next line
nmap <Leader>cl yiwoconsole.log('<c-r>"', <c-r>");<Esc>^
vmap <Leader>cl yoconsole.log('<c-r>"', <c-r>");<Esc>^

" plugin configurations ------------------------------------------------------

" ---- delimitMate ----
let delimitMate_expand_cr = 1
" inoremap <S-Tab> <c-o>a

" ---- ctrlp ----
let g:ctrlp_open_multiple_files = 'ij'

" ---- deoplete ----
let g:deoplete#enable_at_startup = 1
let g:deoplete#source#attribute#min_pattern_length = 2
call deoplete#custom#set("_", 'converters',
													\ [' converter_remove_paren'])

" use tab completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

set completeopt-=preview														" disable preview

" use deoplete for ternjs
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'

" ---- neomake ----
autocmd! BufWritePost,BufEnter * Neomake											" run neomake on every write
autocmd! VimLeave * let g:neomake_verbose = 0				" no exit code on close
let g:neomake_javascript_enabled_makers = ['jshint']
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_python_flake8_make = {
	\ 'exe': ['python3']
	\ }

" ---- vim-session ----
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" ---- nerdtree ----
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ---- ctrlsf ----
let g:ctrlsf_position = 'bottom'

" neovim terminal emulator configurations ------------------------------------

autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" themes and customization ---------------------------------------------------

" ---- vim-airline ----
let g:airline_powerline_fonts = 1
" let g:airline_section_y = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
set ttimeoutlen=0
set noshowmode
let g:airline_theme='kalisi'

" ---- colorscheme ----
colorscheme kalisi
set background=dark

" neovim terminal cursor color
highlight TermCursor ctermfg=red guifg=red

" end of nvim config file ----------------------------------------------------
