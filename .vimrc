" Following lines added by drush vimrc-install on Fri, 19 Sep 2014 00:29:32 +0000.
set nocompatible
call pathogen#infect('/home/matt/.drush/vimrc/bundle/{}')
call pathogen#infect('/home/matt/.vim/bundle/{}')
" End of vimrc-install additions.
source $VIMRUNTIME/vimrc_example.vim

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
  set statusline+=\ [%{getcwd()}] " current dir
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_enable_signs=1
  set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
endif
