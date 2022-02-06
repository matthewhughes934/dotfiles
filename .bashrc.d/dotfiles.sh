#!/bin/bash

__complete_git_alias () {
    local wrapper
    local alias_name
    alias_name="$3"
    wrapper="__complete_git_alias_{$alias_name}"
    eval "$wrapper () { GIT_DIR='$1' GIT_WORK_TREE='$2' __git_wrap__git_main '$3'; }"

    complete -o bashdefault -o default -o nospace -F "$wrapper" "$alias_name" 2>/dev/null \
		|| complete -o default -o nospace -F "$wrapper" "$alias_name"
}

__alias_git () {
    eval "alias $3='git --git-dir=$1 --work-tree=$2'"
    __complete_git_alias "$1" "$2" "$3"
}

__alias_git "$HOME/.dotfiles/dotfiles/" "$HOME" dotfiles
__alias_git "$HOME/.dotfiles/neomuttcfg" "$HOME" neomuttconfig
__alias_git "$HOME/.dotfiles/neomuttcfgpriv" "$HOME" neomuttconfigpriv
