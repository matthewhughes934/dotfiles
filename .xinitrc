#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]
then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]
then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]
then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]
then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ]
then
    for f in /etc/X11/xinit/xinitrc.d/*.sh
    do
        if [ -x "$f" ] 
        then
            . "$f"
        fi
    done
    unset f
fi

# User specific configuration
if [ -d "$XDG_CONFIG_HOME/xinit" ]
then
    for f in "$XDG_CONFIG_HOME/xinit/"*.sh
    do
        source "$f"
    done
fi

export PINENTRY_USER_DATA="gtk"

# Start window manager
# view logs with `journalctl --identifier i3`
/usr/bin/i3 >/dev/null 2> >(logger --tag i3)
