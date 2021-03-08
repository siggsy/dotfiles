if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# System variables
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH
export ZSH="/home/ziga/.oh-my-zsh"
export EDITOR="nvim"
export TERM=st-256color

# OhMyZsh configuration
ZSH_THEME="powerlevel10k/powerlevel10k"
HIST_STAMPS="dd. mm. yyyy"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions vi-mode)
source $ZSH/oh-my-zsh.sh

# Aliases
alias vim="nvim"
alias cvim="nvim ~/.config/nvim/init.vim"
alias switchdp="sudo ddcutil setvcp 0x60 0x0f"

alias es="nvim ~/.zshrc"
alias sc="source ~/.zshrc"
alias -s pdf=zathura
alias -s c=nvim

# Dotfile setup
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# Load p10k prompt
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
