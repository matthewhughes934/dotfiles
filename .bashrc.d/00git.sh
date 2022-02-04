#!/bin/bash

# note: filename is important, since some other configs depend on git
# completions being loaded

GIT_COMPLETER="/usr/share/bash-completion/completions/git"

if [ -f $GIT_COMPLETER ]
then
    source $GIT_COMPLETER
fi
