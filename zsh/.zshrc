#!/usr/bin/zsh

# Environment Variables
ZSH_DID=~/.zsh
ZPLUG_HOME=~/.zsh/zplug

# zplug plugins
source ~/.zsh/zplug/zplug

zplug "njui/alias-tips"
zplug "hchbaw/auto-fs.zsh"
zplug "chriskempson/base16-shell", of:"base16-tomorrow.dark.sh"
zplug "nojhan/liquidprompt"

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

eval $(keychain --eval --agents ssh --quiet --confhost --clear)
