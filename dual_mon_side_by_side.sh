#!/bin/sh
xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x478 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --mode 3440x1440 --pos 1920x0 --rotate normal
sleep 1
i3 restart
