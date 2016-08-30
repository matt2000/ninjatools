set nocompatible

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'mileszs/ack.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/rainbow_parentheses.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-pathogen'

execute pathogen#infect()

" VIM for Drupal below breaks ctags. :-(
execute pathogen#infect('/home/matt/.drush/vimrc/bundle/{}')

"" Settigns and remaps that it's OK for plugin settings to override.
set visualbell
" Relative line numbers
set relativenumber
set undofile
" For real RegEx instead of Vim-style.
nnoremap / /\v
vnoremap / /\v

" Bounce between brackets.
nnoremap <tab> %
vnoremap <tab> %
" Replace All.
set gdefault

" Quick Escape.
inoremap jj <ESC>

" Conveince.
nnoremap ; :

" Training wheels
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Syntastic plugin with Drupal Coding Standards
let g:syntastic_php_phpcs_args="--standard=Drupal --extensions=php,module,inc,install,test,profile,theme"
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
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

set wrap linebreak nolist
set colorcolumn=80
let &showbreak = '|> '
let &breakat = ' '
nnoremap <F8> :setl noai nocin nosi inde=<CR>
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

set ignorecase
set smartcase

set t_Co=256
hi Folded ctermbg=233 ctermfg=248

set shiftwidth=2
set foldmethod=indent

set tags+=/home/matt/www/tags;


" For security.
set modelines=0
