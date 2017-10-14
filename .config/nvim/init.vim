" edys's neovim config file --------------------------------------------------
" date_created: Sept 15, 2016

" dein scripts ---------------------------------------------------------------

" to install dein:
" curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
" sh ./installer.sh {specify the installation directory (~/.vim/dein/)}

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

" ---- dein begin ----
call dein#begin('~/.vim/dein/')
call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')

" general vim as an ide plugins
call dein#add('andrewradev/sideways.vim')
call dein#add('airblade/vim-gitgutter')
call dein#add('chaoren/vim-wordmotion')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('dyng/ctrlsf.vim')
call dein#add('justinmk/vim-sneak')
call dein#add('matze/vim-move')
call dein#add('neomake/neomake')
call dein#add('raimondi/delimitmate')
call dein#add('shougo/deoplete.nvim')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-surround')
call dein#add('gregsexton/matchtag')
call dein#add('xolox/vim-misc')
" call dein#add('rstacruz/sparkup')
" call dein#add('xolox/vim-session')
" call dein#add('ludovicchabant/vim-gutentags')
" call dein#add('scrooloose/nerdtree')
" call dein#add('takac/vim-hardtime')

" themes
call dein#add('freeo/vim-kalisi')
call dein#add('rakr/vim-one')
call dein#add('morhetz/gruvbox')
call dein#add('chriskempson/base16-vim')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('jaxbot/semantic-highlight.vim')

" language specific plugins
call dein#add('pangloss/vim-javascript')
call dein#add('carlitux/deoplete-ternjs', {'build': 'npm install'})
call dein#add('ternjs/tern_for_vim', {'build': 'npm install'})
call dein#add('mxw/vim-jsx')
call dein#add('octol/vim-cpp-enhanced-highlight')
call dein#add('herringtondarkholme/yats.vim')
call dein#add('mhartington/nvim-typescript')

call dein#end()
call dein#save_state()
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
" set hlsearch

set ignorecase					" case-insensitive search, except when using capital letters
set smartcase

set autoindent
set laststatus=2
set confirm
set hidden
set title

set mouse=a

au FileType javascript set tabstop=2 | set softtabstop=2 | set shiftwidth=2
au FileType python set tabstop=4 | set softtabstop=4 | set shiftwidth=4
au FileType c set tabstop=4 | set softtabstop=4 | set shiftwidth=4
au FileType cpp set tabstop=4 | set softtabstop=4 | set shiftwidth=4
au FileType java set tabstop=4 | set softtabstop=4 | set shiftwidth=4
au FileType go set tabstop=4 | set softtabstop=4 | set shiftwidth=4

" custom mappings ------------------------------------------------------------

let mapleader = "\<space>"

" reload .config/nvim/init.vim
" nnoremap <leader>r :source $HOME/.config/nvim/init.vim<CR>

nnoremap j gj
nnoremap k gk

" use K to join line above, similar to J
nnoremap K kJ

" scroll three lines with ctrl-e and ctrl-y
" nnoremap <c-e> 4<c-e>
" nnoremap <c-y> 4<c-y>
nnoremap <c-j> 3<c-e>
nnoremap <c-k> 3<c-y>

" Do not loose the current selection when shift indentation
vnoremap > >gv
vnoremap <lt> <lt>gv

" remap ctrlp re-cache and buffer search
map <c-c> :CtrlPClearCache<cr>
map <c-f> :CtrlPBuffer<cr>

" remap commentary
vmap <leader>k gc
nmap <leader>k gcc

" remap vim-sneak
map <c-s> <Plug>Sneak_s
map <c-e> <Plug>Sneak_S

" ctrlsf
nmap     <leader>f <Plug>CtrlSFPrompt
vmap     <leader>f <Plug>CtrlSFVwordPath
nmap     <leader>F <Plug>CtrlSFCwordPath

" sideways.vim
nnoremap <c-a>h :SidewaysLeft<cr>
nnoremap <c-a>l :SidewaysRight<cr>
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

" vim-wordmotion
let g:wordmotion_prefix = '<leader>'

" fixes displeasing indentation behavior when leaving an empty indented line
" inoremap <CR> <CR>x<BS>
" nnoremap o ox<BS>
" nnoremap O Ox<BS>

nmap <silent> <BS> :nohlsearch<CR>
" nmap <silent> <BS> :let @/=""<return>

" same screen buffer focus
" nnoremap <c-j> <C-W>j
" nnoremap <c-k> <C-W>k
nnoremap <c-h> <C-W>h
nnoremap <c-l> <C-W>l

" map different tab widths to leader
nnoremap <Leader>2 :set expandtab tabstop=2 softtabstop=2 shiftwidth=2<CR>
nnoremap <Leader>4 :set expandtab tabstop=4 softtabstop=4 shiftwidth=4<CR>
nnoremap <Leader>8 :set expandtab tabstop=8 softtabstop=8 shiftwidth=8<CR>

" clipboard
nmap <leader>p :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nmap <leader>y :.w !pbcopy<CR><CR>
vmap <leader>y :w !pbcopy<CR><CR>
" imap <leader>p <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>

" spell mode
map <F12> :set spell!<Bar>set spell?<CR>

" buffer delete
nnoremap <c-q> :bp\|bd #<CR>

" delete to black hole buffer and paste
nmap <leader>r "_dwP

" vim-session
" nnoremap <leader>s :SaveSession
" nnoremap <leader>o :OpenSession

" nerdtree toggle
" nnoremap <leader>d :NERDTreeToggle<CR>

" neovim terminal escape
" tnoremap \<Esc> <C-\><C-n>

" terminal buffer movement
" tnoremap <c-W>j <C-\><C-n><C-W>j
" tnoremap <c-W>k <C-\><C-n><C-W>k
" tnoremap <c-W>h <C-\><C-n><C-W>h
" tnoremap <c-W>l <C-\><C-n><C-W>l

" terminal buffer navigation
" tnoremap <c-b> <C-\><C-n>:bprevious<CR>
" tnoremap <c-n> <C-\><C-n>:bnext<CR>
" tnoremap <c-q> <C-\><C-n>:bd<CR>

" take word under cursor and console.log in next line
nmap <Leader>cl yiwoconsole.log('<c-r>"', <c-r>");<Esc>^
vmap <Leader>cl yoconsole.log('<c-r>"', <c-r>");<Esc>^

" custom functions -----------------------------------------------------------
" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

map <leader>h :call TrimWhiteSpace()<CR>

" plugin configurations ------------------------------------------------------

" ---- delimitMate ----
let delimitMate_expand_cr = 1
let delimitMate_excluded_regions = ''

" ---- ctrlp ----
let g:ctrlp_open_multiple_files = 'ij'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_prompt_mappings = { 'PrtClearCache()': ['<c-c>'] }
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" ---- deoplete ----
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#source#attribute#min_pattern_length = 1

" use tab completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" disable preview
set completeopt-=preview

" use deoplete for ternjs
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'

" ---- neomake ----
autocmd! BufWritePost,BufEnter * Neomake						" run neomake on every write
autocmd! VimLeave * let g:neomake_verbose = 0				" no exit code on close
let g:neomake_highlight_columns = 0
let g:neomake_tempfile_enabled = 1
let g:neomake_javascript_enabled_makers = ['jshint']
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_html_enabled_makers = []
let g:neomake_python_flake8_make = {
	\ 'exe': ['python3']
	\ }
augroup my_neomake_signs
	au!
	autocmd ColorScheme *
			\ hi NeomakeErrorSign ctermfg=white |
			\ hi NeomakeWarningSign ctermfg=yellow
augroup END

" ---- vim-session ----
" let g:session_autosave = 'no'
" let g:session_autoload = 'no'

" ---- nerdtree ----
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ---- ctrlsf ----
let g:sneak#use_ic_scs = 1
let g:sneak#s_next = 1

" ---- ctrlsf ----
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_ignore_dir = ['./tags']

" ---- hardtime ----
" let g:hardtime_default_on = 1
" let g:hardtime_maxcount = 2

" ---- gutentags ----
" let g:gutentags_cache_dir = '~/.cache/ctags'

" ---- sparkup ----
" autocmd FileType javascript,jsx,ejs runtime! ftplugin/html/sparkup.vim

" ---- indentline ----
" let g:indentLine_setColors = 0

" ---- matchtag ----
" autocmd FileType javascript,jsx runtime! ftplugin/html.vim

" ---- semantic highlighting ----
" let g:semanticTermColors = [28,1,2,3,4,5,6,7,25,9,10,34,12,13,14,15,16,125,124,19]

" ---- highlight cursor words ---
" let g:HiCursorWords_style='term=reverse,underlined cterm=reverse gui=reverse'

" neovim terminal emulator configurations ------------------------------------

autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" themes and customization ---------------------------------------------------

if (has("nvim"))
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
	set termguicolors
endif

" ---- vim-airline ----
let g:airline_powerline_fonts = 1
" let g:airline_section_y = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
set ttimeoutlen=0
set noshowmode
let g:airline_theme='one'

" ---- colorscheme ----
let g:one_allow_italics = 1
colorscheme one
set background=dark

" italics
highlight Comment gui=italic

" neovim terminal cursor color
highlight TermCursor ctermfg=red guifg=red

" end of nvim config file ----------------------------------------------------
