#!/bin/sh
export DISPLAY=:0
export XAUTHORITY=/home/xlz/.Xauthority

read status </sys/class/drm/card0-DP-2/status
if [ "$status" = connected ]; then
	sleep 1 # sometime it takes a while to query optimal settings
	xrandr --output eDP1 --auto --primary --output DP2 --auto --same-as eDP1
else
	xrandr --output DP2 --off
fi
