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

alias historvi='fc -re "vim -S ~/.fcrc" -$HISTSIZE -1'
