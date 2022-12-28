#!/bin/bash
export USERNAME=`whoami`

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt install -y fish tmux python-dev python3-pip python3-dev python3-pip neovim

ln -s $(pwd)/tmux.conf $HOME/.tmux.conf

mkdir -p /home/codespace/.config/nvim/
mv $(pwd)/init.vim $HOME/.config/nvim/init.vim

nvim +'PlugInstall --sync' +qa
