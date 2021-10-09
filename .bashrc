#
# ~/.bashrc
#

# If not running interactively, don't do anything
if [[ $- != *i* ]]
then
    return
fi

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

if [ -d ~/.bashrc.d ]
then
    for f in ~/.bashrc.d/*.sh
    do
        source "$f"
    done
fi
