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
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('dyng/ctrlsf.vim')
call dein#add('gregsexton/matchtag')
call dein#add('junegunn/vim-easy-align')
call dein#add('junegunn/vim-peekaboo')
call dein#add('neomake/neomake')
call dein#add('raimondi/delimitmate')
call dein#add('reedes/vim-pencil')
call dein#add('rhysd/clever-f.vim')
call dein#add('shougo/deoplete.nvim')
call dein#add('shougo/echodoc.vim')
call dein#add('simnalamburt/vim-mundo')
call dein#add('sjl/vim-sparkup')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-surround')
call dein#add('unblevable/quick-scope')
call dein#add('vim-airline/vim-airline')
call dein#add('xolox/vim-misc')
" call dein#add('ludovicchabant/vim-gutentags')
" call dein#add('mattn/emmet-vim')
" call dein#add('majutsushi/tagbar')

" themes
call dein#add('freeo/vim-kalisi')
call dein#add('rakr/vim-one')
call dein#add('icymind/neosolarized')
call dein#add('vim-airline/vim-airline-themes')

" language specific plugins
call dein#add('carlitux/deoplete-ternjs', {'build': 'npm install -g tern'})
call dein#add('herringtondarkholme/yats.vim')
call dein#add('pangloss/vim-javascript')
call dein#add('mhartington/nvim-typescript')
call dein#add('mxw/vim-jsx')
call dein#add('octol/vim-cpp-enhanced-highlight')
call dein#add('ternjs/tern_for_vim', {'build': 'npm install'})
call dein#add('vim-ruby/vim-ruby')

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

set ignorecase					" case-insensitive search, except when using capital letters
set smartcase

set autoindent
set laststatus=2
set confirm
set hidden
set title

set nowrap
set sidescroll=1

set mouse=a

au FileType javascript set tabstop=2 | set softtabstop=2 | set shiftwidth=2
au FileType python set tabstop=4 | set softtabstop=4 | set shiftwidth=4
au FileType c set tabstop=4 | set softtabstop=4 | set shiftwidth=4
au FileType cpp set tabstop=4 | set softtabstop=4 | set shiftwidth=4
au FileType java set tabstop=4 | set softtabstop=4 | set shiftwidth=4
au FileType go set tabstop=4 | set softtabstop=4 | set shiftwidth=4

" custom mappings ------------------------------------------------------------

let mapleader = ";"

nnoremap j gj
nnoremap k gk

" use K to join line above, similar to J
nnoremap K kJ

" scroll three lines with ctrl-e and ctrl-y
nnoremap <c-j> 3<c-e>
nnoremap <c-k> 3<c-y>

" horizontal scrolling
nnoremap <c-h> 3zh
nnoremap <c-l> 3zl

" Do not loose the current selection when shift indentation
vnoremap > >gv
vnoremap <lt> <lt>gv

" remap ctrlp re-cache and buffer search
map <c-c> :CtrlPClearCache<cr>
map <c-f> :CtrlPBuffer<cr>

" remap commentary
vmap <leader>k gc
nmap <leader>k gcc

" ctrlsf
nmap     <leader>f <Plug>CtrlSFPrompt
vmap     <leader>f <Plug>CtrlSFVwordPath
nmap     <leader>F <Plug>CtrlSFCwordPath

" sideways.vim
nnoremap <leader>ah :SidewaysLeft<cr>
nnoremap <leader>al :SidewaysRight<cr>
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

" vim-wordmotion
let g:wordmotion_prefix = '<leader>'

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nmap <silent> <BS> :nohlsearch<CR>

" pencil
nnoremap <leader>q :PencilToggle<CR>

" same screen buffer focus
" nnoremap <a-j> <C-W>j
" nnoremap <a-k> <C-W>k
" nnoremap <a-h> <C-W>h
" nnoremap <a-l> <C-W>l

" tmux mappings
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>


" map different tab widths to leader
nnoremap <Leader>2 :set expandtab tabstop=2 softtabstop=2 shiftwidth=2<CR>
nnoremap <Leader>4 :set expandtab tabstop=4 softtabstop=4 shiftwidth=4<CR>
nnoremap <Leader>8 :set expandtab tabstop=8 softtabstop=8 shiftwidth=8<CR>

" clipboard
nmap <leader>p :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nmap <leader>y :.w !pbcopy<CR><CR>
vmap <leader>y :w !pbcopy<CR><CR>

" spell mode
map <F12> :set spell!<Bar>set spell?<CR>

" buffer delete
nnoremap <c-q> :bp\|bd #<CR>

" TODO add this for other languages
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

" ---- clever-f ----
" let g:clever_f_smart_case = 1
let g:clever_f_across_no_line = 1
let g:clever_f_repeat_last_char_inputs = ["\<CR>"]
let g:clever_f_fix_key_direction = 1
nmap <Esc> <Plug>(clever-f-reset)

" ---- ctrlp ----
let g:ctrlp_open_multiple_files = 'ij'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_prompt_mappings = { 'PrtClearCache()': ['<c-c>'] }
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" ---- ctrlsf ----
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_ignore_dir = ['./tags']

" ---- delimitMate ----
let delimitMate_expand_cr = 1
let delimitMate_excluded_regions = ''

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

" ---- gutentags ----
let g:gutentags_cache_dir = "~/.local/share/nvim/tags"

" ---- neomake ----
autocmd! BufWritePost,BufEnter * Neomake						" run neomake on every write
autocmd! VimLeave * let g:neomake_verbose = 0				" no exit code on close
let g:neomake_highlight_columns = 0
let g:neomake_tempfile_enabled = 1
let g:neomake_javascript_enabled_makers = ['eslint']
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
" let g:airline_theme='one'

" ---- colorscheme ----
let g:one_allow_italics = 1
colorscheme one
set background=dark

" italics
highlight Comment gui=italic

" neovim terminal cursor color
highlight TermCursor ctermfg=red guifg=red

" set fillchars=vert:|

" end of nvim config file ----------------------------------------------------
