#!/usr/bin/env sh

source "$HOME/.config/sketchybar/colors.sh"

SSID=$(ipconfig getsummary "$(networksetup -listallhardwareports | awk '/Wi-Fi|AirPort/{getline; print $NF}')" | grep '  SSID : ' | awk -F ': ' '{print $2}')
IP=$(ipconfig getifaddr en0)

if [[ -z "$SSID" ]]; then
    ICON="󰤮" # No Wi-Fi icon
    LABEL="Disconnected"
    COLOR="$WIFI_DISCONNECTED"
else
    ICON="󰤨" # Wi-Fi icon
    LABEL="$SSID ($IP)"
    COLOR="$WIFI_CONNECTED"
fi

sketchybar --set $NAME icon="$ICON" \
                       label="$LABEL" \
                       icon.color="$COLOR"

if [ "$SENDER" = "mouse.clicked" ]; then
    open "x-apple.systempreferences:com.apple.Network-Settings.extension"
fi
