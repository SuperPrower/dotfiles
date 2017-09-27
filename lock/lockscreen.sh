#!/bin/sh

SCRIPTPATH=$(realpath "$0")
SCRIPTPATH=${SCRIPTPATH%/*}

# Get copy of wallpaper
IMAGE="/tmp/lock.png"
WALLP=~/wallpapers/forest.jpg
cp $WALLP $IMAGE

# Scale it to fit screen
convert "$IMAGE" -resize 1920x1080^ -gravity center -extent 1920x1080 $IMAGE

# Add Lock Icon
ICON_ORIG="$SCRIPTPATH/lock_white.png"
ICON="/tmp/lock_icon.png"
cp $ICON_ORIG $ICON
convert "$ICON" -resize 190x190 "$ICON"
convert "$IMAGE" "$ICON" -gravity center -composite "$IMAGE"

PARAM=( --textcolor=ffffff00 --insidecolor=ffffff00 --ringcolor=ffffff3e \
	--linecolor=ffffff00 --keyhlcolor=b5bd68ff --ringvercolor=00000000 \
	--separatorcolor=22222260 --insidevercolor=00000000 \
	--ringwrongcolor=db0000ff --insidewrongcolor=00000000 \
#	--clock --timecolor=ffffffff --timefont="DejaVu Sans Mono"\
#	--datecolor=ffffffff --datefont="DejaVu Sans Mono" \
	--radius=80)

i3lock -e "${PARAM[@]}" -i "$IMAGE"
