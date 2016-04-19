#!/usr/bin/zsh

# Environment Variables
export TERM="xterm-256color"

export ZSH_DID="~/.zsh"
export ZPLUG_HOME="~/.zsh"
export HISTFILE="~/.zsh/history"
export HISTSIZE=10000

# zplug plugins
source ~/.zsh/zplug

zplug "hchbaw/auto-fu.zsh"
zplug "chriskempson/base16-shell", of:"base16-tomorrow.dark.sh"
zplug "nojhan/liquidprompt"
zplug "zsh-users/zsh-syntax-highlighting"

# install zplug plugins
if ! zplug check --verbose ; then
    printf "Install plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# load zplug things
zplug load

# configuration
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nano'
fi

zle-line-init () {
  auto-fu-init
}

zle -N zle-line-init
zle -N zle-keymap-select auto-fu-zle-keymap-select

zstyle ':auto-fu:highlight' input bold
zstyle ':auto-fu:highlight' completion fg=white
zstyle ':auto-fu:highlight' completion/one fg=blue
zstyle ':auto-fu:var' postdisplay ''
zstyle ':auto-fu:var' track-keymap-skip opp
zstyle ':completion:*' completer _oldlist _complete

eval $(keychain --eval --agents ssh --quiet --confhost --clear)

# Options
setopt correct
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt print_eight_bit
