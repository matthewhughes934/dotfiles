#!/bin/bash

load_keychain () {
    # from keychain(1) under EXAMPLES
    if [ -z "$HOSTNAME" ]
    then
        HOSTNAME="$(uname -n)"
    fi

    if [ -f "$HOME/.keychain/$HOSTNAME-sh" ]
    then
        # shellcheck disable=SC1090
        source "$HOME/.keychain/$HOSTNAME-sh"
    fi

    if [ -f "$HOME/.keychain/$HOSTNAME-sh-gpg" ]
    then
        # shellcheck disable=SC1090
        source "$HOME/.keychain/$HOSTNAME-sh-gpg"
    fi
}

unlock_key () {
    keychain --timeout 30 --quiet "$@"
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
