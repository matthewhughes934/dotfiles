#!/bin/bash

PS1=""
PROMPT_COMMAND=(
    __prompt_setup
    __prompt_suffix_exit_code
    __prompt_suffix_jobs
    __prompt_suffix_path
    __prompt_suffix_ssh
    __prompt_suffix
)

__prompt_setup() {
    # use a delimiter to separate our PS1 changes from anything else
    # e.g. in a python virtual env we have '(.venv) <our PS1>'
    local ps1_delim
    # delimiter: ASCII unit separator
    ps1_delim="$(printf "\[\x1f\]")"
    # trim everything after the last delim instance (i.e. our PS1 changes)
    PS1="${PS1%"$ps1_delim"*}"
    # add the delim instance
    PS1+="$ps1_delim"
}

__prompt_suffix_exit_code() {
    # must be first line, capture exit of command we just ran
    local LAST_EXIT="$?"

    if [ "$LAST_EXIT" -eq 0 ]
    then
        PS1+="✓"
    else
        PS1+="✗($LAST_EXIT)"
    fi

}

__prompt_suffix_jobs() {
    local job_count
    job_count="$(jobs | wc --lines)"
    if [ "$job_count" -ne 0 ]
    then
        PS1+="[j:$job_count]"
    fi
}

__prompt_suffix_path() {
    local white="\033[37;0m"
    local bold_cyan="\033[36;1m"
    PS1+="\[$bold_cyan\]\$PWD\[$white\]"
}

__prompt_suffix_ssh() {
    # add user@host to make it clear we've SSH'd
    if [ -n "${SSH_TTY:-}" ]
    then
        PS1+="(\u@\H)"
    fi
}

__prompt_suffix() {
    PS1+="$ "
}
