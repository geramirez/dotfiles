#!/bin/bash
export USERNAME=`whoami`

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

mkdir -p ~/.config/nvim/
ln -s $(pwd)/init.vim $HOME/.config/nvim/init.vim
ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/vimrc $HOME/.vimrc
ln -s $(pwd)/vim $HOME/.vim
# ln -s $(pwd)/emacs $HOME/.emacs
# ln -s $(pwd)/screenrc $HOME/.screenrc
vim -Es -u $HOME/.vimrc -c "PlugInstall | qa"

# zsh configuration
sudo apt-get update
sudo apt-get install -y zsh fonts-powerline neovim
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -y
echo "$(starship init zsh)" >> ~/.zshrc

ln -s $(pwd)/cs_tooling $HOME/.cs_tooling
