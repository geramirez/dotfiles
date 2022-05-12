#!/bin/bash
export USERNAME=`whoami`

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

#cs_tooling
ln -s $(pwd)/cs_tooling $HOME/.cs_tooling

sudo apt-get install -y zsh fonts-powerline neovim rcm tmux exuberant-ctags silversearcher-ag
rcup -f -v -d . -t linux -t development

ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/vimrc $HOME/.vimrc
ln -s $(pwd)/vim $HOME/.vim
ln -s $(pwd)/screenrc $HOME/.screenrc
vim -Es -u $HOME/.vimrc -c "PlugInstall | qa"

# zsh configuration
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chsh -s "$(which zsh)" "$(whoami)"

sudo gem install ripper-tags && sudo ripper-tags -R
