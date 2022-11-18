#!/bin/bash
export USERNAME=`whoami`

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

ln -s $(pwd)/tmux.conf $HOME/.tmux.conf