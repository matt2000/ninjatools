ln -s ~/ninjatools/gitconfig ~/.gitconfig
ln -s ~/ninjatools/bash_aliases ~/.bash_aliases
ln -s ~/ninjatools/bashrc ~/.bashrc

ln -s ~/ninjatools/vimrc ~/.vimrc
mkdir -p ~/.config/nvim/bundle
ln -s ~/ninjatools/vimrc ~/.config/nvim/init.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
nvim +PluginInstall +qall

mkdir ~/.bash
cd ~/.bash
git clone git://github.com/jimeh/git-aware-prompt.git
cd -
