#!/bin/sh

xbindkeys

# Disable caps lock
#setxkbmap -option ctrl:nocaps

xmodmap .Xmodmap


xrandr --output LVDS-1 --mode 1920x1200 --pos 1920x0 --rotate normal --output DVI-I-1 --mode 1920x1080 --pos 0x0 --rotate normal
nitrogen --restore

exec awesome
