#!/bin/sh

# Setups second screen

if [[ $# -eq 0 || ($1 -ne 'l'&& $1 -ne 'r') ]]
then
	echo 'Using laptop screen'
	xrandr --output eDP1 --primary --auto --output HDMI1 --off
else
	echo 'Using laptop screen and HDMI monitor'
	case $1 in
		l) ARG="--left-of" ;;
		r) ARG="--right-of" ;;
	esac

	xrandr --output eDP1 --primary --auto --output HDMI1 ${ARG} eDP1 --auto

fi

feh --bg-fill ~/wallpapers/forest.jpg &
