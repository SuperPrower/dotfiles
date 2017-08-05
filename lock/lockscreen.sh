#!/bin/sh

SCRIPTPATH=$(realpath "$0")
SCRIPTPATH=${SCRIPTPATH%/*}

# Get copy of wallpaper
IMAGE="/tmp/lock.png"
WALLP=~/wallpapers/forest_hd.jpg
cp $WALLP $IMAGE

# Add Lock Icon
ICON="$SCRIPTPATH/lock_white.png"
convert "$IMAGE" "$ICON" -gravity center -composite "$IMAGE"

PARAM=(--textcolor=ffffff00 --insidecolor=ffffff00 --ringcolor=ffffff3e \
	--linecolor=ffffff00 --keyhlcolor=b5bd68ff --ringvercolor=00000000 \
	--separatorcolor=22222260 --insidevercolor=00000000 \
	--ringwrongcolor=db0000ff --insidewrongcolor=00000000)

i3lock -e "${PARAM[@]}" -i "$IMAGE"
