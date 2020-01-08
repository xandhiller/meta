#!/bin/sh
xrandr --output HDMI-2 --off --output HDMI-1 --mode 1920x1080 --dpi 96 --pos 336x0 --rotate normal --output DP-1 --off --output eDP-1 --primary --mode 2736x1824 --dpi 267 --pos 0x1080 --rotate normal --output DP-2 --off

export GDK_DPI_SCALE=0.70
