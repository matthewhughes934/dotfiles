#!/bin/sh
# Additional Xorg specific input configuration

# keyboard configuration
setxkbmap -option caps:swapescape

alias kb_us='setxkbmap -layout us'
alias kb_int='setxkbmap -layout us -variant intl'
