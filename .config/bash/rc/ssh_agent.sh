#!/bin/bash

# from https://wiki.archlinux.org/title/SSH_keys#ssh-agent

AGENT_FILE="$XDG_RUNTIME_DIR/ssh-agent.env"

if [ "$(pgrep --euid "$USER" ssh-agent | wc --lines)" -eq 0 ]
then
    ssh-agent -t 1h > "$AGENT_FILE"
fi

if [ -z "$SSH_AUTH_SOCK" ]
then
    source "$AGENT_FILE" >/dev/null
fi
