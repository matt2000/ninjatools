#/bin/sh
set -x

#Assumed location of this script...
PWD=`pwd`

mv ~/.gitconfig ~/.gitconfig.BAK
ln -s $PWD/gitconfig ~/.gitconfig
mv ~/.bash_aliases ~/.bash_aliases.BAK
ln -s $PWD/bash_aliases ~/.bash_aliases

mkdir ~/.bash
cd ~/.bash && git clone https://github.com/jimeh/git-aware-prompt.git
cd $PWD

mv ~/.bashrc ~/.bashrc.BAK
ln -s $PWD/bashrc ~/.bashrc


ln -s $PWD/vimrc ~/.vimrc
mkdir -p ~/.config/nvim/bundle
mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.BAK
ln -s $PWD/vimrc ~/.config/nvim/init.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
nvim +PluginInstall +qall
