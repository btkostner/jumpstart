#!/usr/bin/zsh

# Keep zsh history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Environment Variables
export PATH="$HOME/.bin:$PATH"

export ZSH_DID="$HOME/.zsh"
export ZPLUG_HOME="$HOME/.zsh"
export HISTFILE="$HOME/.zsh/history"
export HISTSIZE=10000

export FZF_DEFAULT_COMMAND='ag -U -g ""'

export LP_USER_ALWAYS=0
export LP_PERCENTS_ALWAYS=0
export LP_ENABLE_JOBS=0
export LP_ENABLE_LOAD=0
export LP_ENABLE_BATT=0
export LP_ENABLE_TEMP=0

# asdf
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# zplug
source $HOME/.zsh/init.zsh

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

# Auto set title
autoload -Uz add-zsh-hook

function xterm_title_precmd () {
	print -Pn -- '\e]2;%n@%m %~\a'
	[[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}

function xterm_title_preexec () {
	print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
	[[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}

if [[ "$TERM" == (screen*|xterm*|rxvt*|tmux*|putty*|konsole*|gnome*) ]]; then
	add-zsh-hook -Uz precmd xterm_title_precmd
	add-zsh-hook -Uz preexec xterm_title_preexec
fi

# Start sway
if [ "$(tty)" = "/dev/tty1" ]; then
  # exec sway
fi

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

# Functions
eset(){
    export VI_SERVER=$1
}

vs(){
    eset $1
    vim --servername $VI_SERVER
}

es(){
    vim --servername $VI_SERVER --remote-silent $*
}

compdef _vim es

preview() {
    local file=$(fzf --no-multi --select-1 --exit-0 --preview 'bat --color always {}')

    if [[ -n $file ]]; then
        vim "$file"
    fi
}

# Secret envs
export AWS_ACCESS_KEY_ID='XXX'
export AWS_SECRET_ACCESS_KEY='XXX'
export AWS_REGION='XXX'

export GITHUB_TOKEN='XXX'

# Alias
alias ..='cd ..; ls'
alias ...='cd ..; cd ..; ls'

alias cat='bat'
alias help='tldr'
alias ls='ls -hal --color'
alias man='tldr'

alias db='docker build -t'
alias dr='docker run -ti'

alias anst='ansible-playbook -s -i local --ask-become-pass --vault-password-file vault.txt'
alias ansd='ansible-vault decrypt --vault-password-file vault.txt'
alias anse='ansible-vault encrypt --vault-password-file vault.txt'

alias disk='ncdu --color dark -rr -x --exclude .git --exclude node_modules'
alias preview="vim \$(fzf --preview 'bat --color always {}')"

alias music='ncmpcpp'
alias stream='streamlink'
