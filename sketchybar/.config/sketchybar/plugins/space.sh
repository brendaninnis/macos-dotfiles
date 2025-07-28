#!/bin/sh

source "$HOME/.config/sketchybar/colors.sh"

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

if [ "$SELECTED" = "true" ]; then
  sketchybar --set "$NAME" background.color="$ACCENT" \
                           icon.color="$BG_PRI" \
                           background.drawing="on"
else
  sketchybar --set "$NAME" background.color="$BG_SEC" \
                           icon.color="$INACTIVE" \
                           background.drawing="on"
fi
