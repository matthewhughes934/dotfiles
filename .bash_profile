export PATH="$PATH:$HOME/bin:$HOME/.local/bin"

if [ -d ~/.bash_profile.d ]
then
    for f in ~/.bash_profile.d/*.sh
    do
        source "$f"
    done
fi

# if interactive
if [[ $- == *i* ]]
then
    source ~/.bashrc
fi

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR:-0}" -eq 1 ]
then
    exec startx
fi
