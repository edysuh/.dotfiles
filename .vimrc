" edys's neovim config file --------------------------------------------------
" date_created: Sept 15, 2016

" dein scripts ---------------------------------------------------------------

set runtimepath+=~/.vim/dein//repos/github.com/Shougo/dein.vim

" ---- dein begin ----
call dein#begin('~/.vim/dein/')
call dein#add('shougo/dein.vim')

" general vim as an ide plugins
call dein#add('raimondi/delimitmate')
call dein#add('shougo/neocomplcache.vim')
call dein#add('neomake/neomake')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-surround')
call dein#add('xolox/vim-misc')
call dein#add('xolox/vim-session')
call dein#add('shougo/vimproc.vim', {'build': 'make'})
call dein#add('shougo/unite.vim')
call dein#add('shougo/neomru.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('ctrlpvim/ctrlp.vim')

" themes
" call dein#add('freeo/vim-kalisi')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('jaxbot/semantic-highlight.vim')

" language specific plugins
call dein#add('pangloss/vim-javascript')

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
set mouse=a
set backspace=indent,eol,start

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
nnoremap <leader>b :tabprevious<CR>
nnoremap <leader>n :tabnext<CR>

" buffer navigation
nnoremap <c-b> :bprevious<CR>
nnoremap <c-n> :bnext<CR>
nnoremap <c-q> :bd<CR>

" plugin configurations ------------------------------------------------------

" ---- delimitMate ----
let delimitMate_expand_cr = 1
" inoremap <S-Tab> <c-o>a

" ---- neocomplcache ----
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 2
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" ---- neomake ----
autocmd! BufWritePost,BufEnter * Neomake											" run neomake on every write
autocmd! VimLeave * let g:neomake_verbose = 0				" no exit code on close
let g:neomake_javascript_enabled_makers = ['jshint']
let g:neomake_c_enabled_makers = ['gcc']

" ---- vim-session ----
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" ---- unite ----
nnoremap [unite] <Nop>
nmap U [unite]

let g:unite_source_history_yank_enable = 1
" call unite#filters#matcher_default#use(['matcher_fuzzy'])

nnoremap [unite]f :<c-u>Unite -buffer-name=files file<cr>
nnoremap [unite]r :<c-u>Unite -buffer-name=rec file_rec/async:!<cr>
nnoremap [unite]b :<c-u>Unite -buffer-name=buffer buffer<cr>
nnoremap [unite]g :<c-u>Unite -buffer-name=grep_ag grep:.<cr>
nnoremap [unite]m :<c-u>Unite -buffer-name=mru file_mru<cr>
" nnoremap [unite]o :<c-u>Unite -buffer-name=outline outline<cr>
" nnoremap [unite]y :<c-u>Unite -buffer-name=yank history/yank<cr>

if executable('ag')
    let g:unite_source_rec_async_command = 'ag --follow --nocolor --nogroup --hidden -g ""'
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden'
    let g:unite_source_grep_recursive_opt=''
endif

autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

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
" colorscheme kalisi
set background=dark

let g:dein#install_process_timeout = 240

" end of nvim config file ----------------------------------------------------
