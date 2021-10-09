#
# ~/.bash_profile
#

export PATH="$PATH:$HOME/bin"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]
then
    exec startx
fi
