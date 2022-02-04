#!/bin/bash

alias dotfiles="git --git-dir=$HOME/.dotfiles/dotfiles --work-tree=$HOME"
alias i3config="git --git-dir=$HOME/.dotfiles/i3 --work-tree=$HOME"
alias neomuttconfig="git --git-dir=$HOME/.dotfiles/neomuttcfg --work-tree=$HOME"
alias neomuttconfigpriv="git --git-dir=$HOME/.dotfiles/neomuttcfgpriv --work-tree=$HOME"

__git_complete dotfiles git
__git_complete i3config git
__git_complete neomuttconfig git
__git_complete neomuttconfigpriv git
