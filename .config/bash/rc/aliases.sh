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

alias start_record_history='\
    shopt -s histappend; \
    _OLD_PROMPT_COMMAND="$PROMPT_COMMAND"; \
    PROMPT_COMMAND="history -a;$PROMPT_COMMAND";'
alias stop_record_history='\
    shopt -u histappend; \
    PROMPT_COMMAND="$_OLD_PROMPT_COMMAND"; \
    unset _OLD_PROMPT_COMMAND'

function go-compile-test {
    # for flags, see: go tool compile -help
    go test -c -gcflags '-N -l' "$@"
}

# convenience function for going to root of git repo
# git rroot is a custom git alias
alias gitroot='cd $(git rroot)'
