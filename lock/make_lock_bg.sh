#!/bin/sh
#
# This script adds round lock icon to lockscreen image

SCRIPTPATH=$(realpath "$0")
SCRIPTPATH=${SCRIPTPATH%/*}

# Get copy of wallpaper
IMAGE="/tmp/lock.png"
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
