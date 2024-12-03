#!/bin/bash

PROMPT_COMMAND=__prompt_command

__prompt_command() {
    # must be first line, capture exit of command we just ran
    local LAST_EXIT="$?"

    if [ "$LAST_EXIT" -eq 0 ]
    then
        PS1="✓"
    else
        PS1="✗"
    fi

    local white="\033[37;0m"
    local bold_cyan="\033[36;1m"
    PS1+="\[$bold_cyan\]\$PWD\[$white\]$ "

    # add user@host to make it clear we've SSH'd
    if [ -n "${SSH_TTY:-}" ]
    then
        PS1="\u@\H:$PS1"
    fi
}
