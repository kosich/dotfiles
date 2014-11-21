#!/usr/bin/env bash
xsetroot -solid "#333333" &
setxkbmap ru &
setxkbmap us &
setxkbmap -option grp:switch,grp:caps_toggle,grp_led:scroll us,ru &
xrandr --auto --output HDMI1 --mode 1920x1080 --left-of LVDS1 &
exec xmonad
