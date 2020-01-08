#!/usr/bin/env bash
icon="$HOME/Pictures/lock.png"
tmpbg="/tmp/screen.png"

(( $# )) && { icon=$1; }

scrot "$tmpbg" 

convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg" 
convert "$tmpbg" -spread 1  "$tmpbg" 
# convert "$tmpbg" -gravity center -composite "$tmpbg"
i3lock -u -i "$tmpbg"
