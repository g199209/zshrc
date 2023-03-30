#!/bin/bash

set -xue

function git-pull-or-clone {
  if [ -d "$1" ]; then
    cd "$1"
    git pull
  else
    git clone "$2" "$1"
  fi
}

function force-link {
  rm -f $2
  ln $1 $2
}

force-link ./.zshrc $HOME/.zshrc

# oh-my-zsh

ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$ZSH/custom"

git-pull-or-clone $ZSH git@github.com:ohmyzsh/ohmyzsh.git

force-link ./gmf-theme.zsh-theme $ZSH_CUSTOM/themes/gmf-theme.zsh-theme

git-pull-or-clone $ZSH_CUSTOM/plugins/zsh-autosuggestions git@github.com:zsh-users/zsh-autosuggestions.git
git-pull-or-clone $ZSH_CUSTOM/plugins/zsh-syntax-highlighting git@github.com:zsh-users/zsh-syntax-highlighting.git


# fzf
git-pull-or-clone $HOME/.fzf git@github.com:junegunn/fzf.git
cd $HOME/.fzf && ./install --no-zsh --no-bash --no-fish

