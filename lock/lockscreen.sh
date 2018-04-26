#!/bin/sh

SCRIPTPATH=$(realpath "$0")
SCRIPTPATH=${SCRIPTPATH%/*}

IMAGE="/tmp/lock.png"

if [ ! -e "$IMAGE" ]; then
	echo "Image not found, creating new one"

	# Get copy of wallpaper
	WALLP="$LOCKSCREEN_IMAGE"
	cp $WALLP $IMAGE

	# Scale it to fit screen
	convert "$IMAGE" -resize 1920x1080^ -gravity center -extent 1920x1080 $IMAGE

	# Add Lock Icon
	ICON_ORIG="$SCRIPTPATH/lock_white.png"
	ICON="/tmp/lock_icon.png"
	cp $ICON_ORIG $ICON
	convert "$ICON" -resize 190x190 "$ICON"
	convert "$IMAGE" "$ICON" -gravity center -composite "$IMAGE"
fi

i3lock
