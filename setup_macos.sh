#/bin/sh
set -x
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install ghostty
brew install zellij
brew install neovim
brew install pipx
pipx install uv
pipx ensurepath
PATH=$PATH:$HOME/.local/bin/
pipx completions
pipx install argcomplete
bash -c 'eval "$(register-python-argcomplete pipx)"'
mkdir $HOME/workspace
cd $HOME/workspace
git clone git@github.com:matt2000/ninjatools.git
cd ninjatools
sh install.sh
