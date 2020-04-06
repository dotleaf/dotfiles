#!/bin/sh

userresources=$HOME/.config/xorg/Xresources
sysresources=/etc/X11/xinit/.Xresources

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

# start some nice programs

xsetroot -cursor_name left_ptr

sxhkd &
exec bspwm
