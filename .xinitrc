#!/bin/sh

#echo -e "connect 10:9A:DD:71:E5:1B" | bluetoothctl

#xset r rate 200 40 # Make keyboard faster
#pointer = 1 25 3 4 5 6 7 8 9 # Also apple mouse middle click is annoying

xbindkeys

xmodmap .Xmodmap
# Disable caps lock
setxkbmap -option ctrl:nocaps

exec awesome

