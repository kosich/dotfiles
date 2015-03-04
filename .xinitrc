#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

setxkbmap -layout "us,ru"
setxkbmap -option "grp:caps_toggle,grp_ledscroll"
xrdb /home/kos/.Xdefaults
feh --bg-scale /home/kos/homepage/dotfiles/background.png

sxhkd &
exec bspwm

