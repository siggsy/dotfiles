#!/bin/bash

# Install ohmyzsh
ZSH=${ZSH:-~/.oh-my-zsh}
REPO=${REPO:-ohmyzsh/ohmyzsh}
REMOTE=${REMOTE:-https://github.com/${REPO}.git}
BRANCH=${BRANCH:-master}
git clone -c core.eol=lf -c core.autocrlf=false \
  -c fsck.zeroPaddedFilemode=ignore \
  -c fetch.fsck.zeroPaddedFilemode=ignore \
  -c receive.fsck.zeroPaddedFilemode=ignore \
  --depth=1 --branch "$BRANCH" "$REMOTE" "$ZSH" || {
  fmt_error "git clone of oh-my-zsh repo failed"
  exit 1
}

source .zshrc

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Vim plug install
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
