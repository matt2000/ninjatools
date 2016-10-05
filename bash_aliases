alias bip='ssh -i ~/workspace/bip/keys/bi-emr-key.pem hadoop@emr-master'
alias bipc='scp -i ~/workspace/bip/keys/bi-emr-key.pem'
alias redshift='psql -h data-science.cxe2dqskszui.us-west-2.redshift.amazonaws.com -p 5439 dev root'
alias redtest='psql -h data-science-test.cxe2dqskszui.us-west-2.redshift.amazonaws.com -p 5439 dev root'
alias clip='xclip -sel clip'
alias vim="nvim -c ':sp term://bash|wincmd J|8wincmd -|wincmd k'"
