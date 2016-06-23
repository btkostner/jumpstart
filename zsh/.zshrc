#!/usr/bin/zsh

# Environment Variables
export TERM="xterm-256color"

export PATH="$HOME/.bin:$PATH"

export ZSH_DID="$HOME/.zsh"
export ZPLUG_HOME="$HOME/.zsh"
export HISTFILE="$HOME/.zsh/history"
export HISTSIZE=10000

export LP_USER_ALWAYS=0
export LP_PERCENTS_ALWAYS=0
export LP_ENABLE_JOBS=0
export LP_ENABLE_LOAD=0
export LP_ENABLE_BATT=0
export LP_ENABLE_TEMP=0

export NVM_DIR="$HOME/.config/nvm"

export GOPATH="$HOME/Projects/golang"

# zplug
source $HOME/.zsh/zplug

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "chriskempson/base16-shell", use:"base16-tomorrow.dark.sh"
zplug "nojhan/liquidprompt"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"

# Install zplug plugins
if ! zplug check --verbose ; then
    printf "Install plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Load zplug things
zplug load

# Configuration
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nano'
fi

eval $(keychain --eval --agents ssh --quiet --confhost --clear)

# Options
setopt correct
setopt APPEND_HISTORY
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt print_eight_bit

# Alias
alias ..='cd ..; ls'
alias ...='cd ..; cd ..; ls'

alias ls='ls -hal --color'

alias db='docker build -t'
alias dr='docker run -ti'

alias anst='ansible-playbook -s -i local --ask-become-pass --vault-password-file vault.txt'
alias ansd='ansible-vault decrypt --vault-password-file vault.txt'
alias anse='ansible-vault encrypt --vault-password-file vault.txt'

# The lesser scripts
source /usr/share/nvm/nvm.sh
