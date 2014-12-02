#!/bin/sh


xset r rate 200 40 # Make keyboard faster
xset m 1/2 4 # Apple mouse is ridiculously fast

xmodmap .Xmodmap
xbindkeys
exec awesome
