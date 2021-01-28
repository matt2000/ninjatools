set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/rainbow_parentheses.vim'
Plugin 'tpope/vim-pathogen'
Plugin 'neomake/neomake'
Plugin 'vim-airline/vim-airline'
Plugin 'zah/nim.vim'
" Syntastic is now replaced, except for Drupal.
"Plugin 'vim-syntastic/syntastic' 
Plugin 'Valloric/YouCompleteMe', {
     \ 'build'      : {
        \ 'mac'     : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'unix'    : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'windows' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'cygwin'  : './install.sh --clang-completer --system-libclang --omnisharp-completer'
        \ }
     \ }

Plugin 'SirVer/ultisnips'
" Snippets for ultisnips
Plugin 'honza/vim-snippets'
Plugin 'sbdchd/neoformat'
Plugin 'tell-k/vim-autopep8'
Plugin 'airblade/vim-gitgutter'
Plugin 'psf/black'

call vundle#end()

" Allow YCM for all filetypes.
let g:ycm_filetype_blacklist = {}

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger=";;"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips'
"set runtimepath+=~/.config/nvim/UltiSnips

"" Settigns and remaps that it's OK for plugin settings to override.
set visualbell
" Relative line numbers
set relativenumber
set undofile
" For real RegEx instead of Vim-style.
nnoremap / /\v
vnoremap / /\v

" Replace All.
set gdefault

" Quick Escape.
inoremap jj <ESC>

" Convienience.
nnoremap ; :
nnoremap <C-f> :Autopep8


" Terminal Escape
tnoremap <Esc> <C-\><C-n>

" Syntastic plugin with Drupal Coding Standards
"let g:syntastic_php_phpcs_args="--standard=Drupal --extensions=php,module,inc,install,test,profile,theme"
 " from https://github.com/spf13/spf13-vim/blob/master/.vimrc
if has('statusline')
  set laststatus=2
  " Broken down into easily includeable segments
  set statusline=%<%f\ " Filename
  set statusline+=%w%h%m%r " Options
  set statusline+=%{fugitive#statusline()} " Git Hotness
  set statusline+=\ [%{&ff}/%Y] " filetype
  " set statusline+=\ [%{getcwd()}] " current dir
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_enable_signs=1
  set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
endif

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_python_exec = '/usr/bin/python3'


" Trim trailing white-space on save.
autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
autocmd VimLeave * mksession! /home/matt/.session.vim
autocmd FileType md set filetype=markdown
autocmd FileType conf set filetype=yaml
autocmd FileType pp set filetype=puppet
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1
" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3

set wrap linebreak nolist
set colorcolumn=80
let &showbreak = '\'
let &breakat = ' '
nnoremap <F8> :setl noai nocin nosi inde=<CR>
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

set ignorecase
set smartcase

set t_Co=256
hi Folded ctermbg=233 ctermfg=248

set shiftwidth=2
set expandtab
set tabstop=4
autocmd Filetype python set shiftwidth=4
set foldmethod=indent


" For security.
set modelines=0

set tags=./tags


"" Neomake will handle linting python, see below.
"let g:syntastic_python_checkers = ['pylama', 'mypy']
"let g:syntastic_aggregate_errors = 1
"let g:syntastic_debug = 33

" Neomake config
function! MyOnBattery()
  if has('mac')
    return
    " @TODO
  endif
  return readfile('/sys/class/power_supply/AC/online') == ['0']
endfunction

if MyOnBattery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('nw', 1000)
endif

let g:neomake_open_list = 2
let g:neomake_python_mypy_maker = {
   \ 'exe': 'mypy',
   \ 'args': ['--check-untyped-defs', '--allow-untyped-defs',
   \          '--ignore-missing', '--follow-imports=skip'],
   \ 'errorformat': '%E%f:%l: error: %m,%W%f:%l: warning: %m,%I%f:%l: note: %m',
   \ }
let g:neomake_python_enabled_makers = ['python', 'pylama', 'mypy']

let g:neoformat_enabled_python = ['docformatter']

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" Color
highlight Search ctermbg=242 cterm=bold


