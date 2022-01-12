#!/bin/bash

# Enable color support
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# convnient aliases
alias ll='ls -l'
alias la='ls -Al'
alias l='ls -CF'

alias xclipb='xclip -selection "clipboard"'

function mcd {
    mkdir --parents "$1" && cd "$1"
}

alias historvi="fc -re 'vim -S $HOME/.config/historvi/config' -$HISTSIZE -1"

alias kb_us='setxkbmap -layout us'
alias kb_int='setxkbmap -layout us -variant intl'
