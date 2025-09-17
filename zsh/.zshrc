# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(git zsh-vi-mode zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

alias v="nvim"
alias vim="nvim"
alias ovim="vim"

export PATH="/home/ian/.local/bin:$PATH"

# node version manager
source /usr/share/nvm/init-nvm.sh

# exa (ls) aliases
# general use
alias ls='exa --icons=auto'
alias l='exa -lbF --git --icons=auto'
alias ll='exa -lbGF --git --icons=auto'
alias llm='exa -lbGd --git --sort=modified --icons=auto'
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale --icons=auto'
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --icons=auto'

# bat (cat) aliases
alias cat='bat -pp'
alias cats='bat'
