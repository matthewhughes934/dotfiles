## History control
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append, rather than overwrite, the history file
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

## Misc

# Stops Ctrl+S from locking the terminal
stty -ixon

if [ -d ~/.config/bash/rc/ ]
then
    for f in ~/.config/bash/rc/*.sh
    do
        source "$f"
    done
fi
