alias clip='xclip -sel clip'
alias randstr="cat /dev/urandom |base64 |head -3 | cut -b -32"
alias ll='ls -alh'
alias gist=gist-paste
alias py3='source ~/py3/bin/activate'
alias vim="nvim -c ':sp term://bash|wincmd J|8wincmd -|wincmd k'"

source ~/ninjatools/autovenv.sh
alias cd="autovenv"

source ~/.local_aliases
