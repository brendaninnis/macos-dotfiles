#!/bin/sh

source "$HOME/.config/sketchybar/colors.sh"

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case "${PERCENTAGE}" in
  100)      ICON="󰁹"
            COLOR="$BATTERY_HIGH"
  ;;
  9[0-9])   ICON="󰂂"
            COLOR="$BATTERY_HIGH"
  ;;
  8[0-9])   ICON="󰂁"
            COLOR="$BATTERY_HIGH"
  ;;
  7[0-9])   ICON="󰂀"
            COLOR="$BATTERY_HIGH"
  ;;
  6[0-9])   ICON="󰁿"
            COLOR="$BATTERY_HIGH"
  ;;
  5[0-9])   ICON="󰁾"
            COLOR="$BATTERY_MED"
  ;;
  4[0-9])   ICON="󰁽"
            COLOR="$BATTERY_MED"
  ;;
  3[0-9])   ICON="󰁼"
            COLOR="$BATTERY_MED"
  ;;
  2[0-9])   ICON="󰁻"
            COLOR="$BATTERY_MED"
  ;;
  1[0-9])   ICON="󰁺"
            COLOR="$BATTERY_LOW"
  ;;
  0[0-9])   ICON="󰂎"
            COLOR="$BATTERY_LOW"
  ;;
  *) ICON="󰂃"
     COLOR="$BATTERY_LOW"
esac

if [[ "$CHARGING" != "" ]]; then
    case "${PERCENTAGE}" in
      100)      ICON="󰂅"
                COLOR="$BATTERY_HIGH"
      ;;
      9[0-9])   ICON="󰂋"
                COLOR="$BATTERY_HIGH"
      ;;
      8[0-9])   ICON="󰂊"
                COLOR="$BATTERY_HIGH"
      ;;
      7[0-9])   ICON="󰢞"
                COLOR="$BATTERY_HIGH"
      ;;
      6[0-9])   ICON="󰂉"
                COLOR="$BATTERY_HIGH"
      ;;
      5[0-9])   ICON="󰢝"
                COLOR="$BATTERY_MED"
      ;;
      4[0-9])   ICON="󰂈"
                COLOR="$BATTERY_MED"
      ;;
      3[0-9])   ICON="󰂇"
                COLOR="$BATTERY_MED"
      ;;
      2[0-9])   ICON="󰂆"
                COLOR="$BATTERY_MED"
      ;;
      1[0-9])   ICON="󰢜"
                COLOR="$BATTERY_LOW"
      ;;
      0[0-9])   ICON="󰢟"
                COLOR="$BATTERY_LOW"
      ;;
      *) ICON="󰂃"
         COLOR="$BATTERY_LOW"
    esac
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set "$NAME" icon="$ICON" \
                         label="${PERCENTAGE}%" \
                         icon.color="$COLOR"
