#!/bin/sh
#
# Setups second screen

if [[ $# -eq 0 || ($1 -ne 'l'&& $1 -ne 'r') ]] 
then
    echo 'Using laptop screen'
	xrandr --output eDP1 --primary --auto --output HDMI1 --off
else
	echo 'Using laptop screen and HDMI monitor'
	while getopts "lr" opt
	do
		case $opt in
    		l) ARG='--left-of' ;;
    		r) ARG='--right-of' ;;
		esac
	done
	
	xrandr --output eDP1 --primary --auto --output HDMI1 --auto $ARG eDP1
	
fi

feh --bg-fill /media/data/data/Images/Wallpapers/landscape.jpg &
