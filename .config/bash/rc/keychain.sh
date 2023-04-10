#!/bin/bash

unlock_key () {
    ssh-add -t 28800 "$HOME/.ssh/$1"
}

_complete_unlock_key () {
    local current_word="$2"
    local ssh_keys
    ssh_keys="$(\
        find "$HOME/.ssh" -type f -name '*.pub' -exec basename {} .pub \; \
    )"

    readarray -t COMPREPLY < <(compgen -W "$ssh_keys" -- "$current_word")
}

complete -F _complete_unlock_key unlock_key
