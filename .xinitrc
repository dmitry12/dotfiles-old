#!/bin/sh

xbindkeys

# Disable caps lock
setxkbmap -option ctrl:nocaps

xmodmap .Xmodmap

exec awesome
