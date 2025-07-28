sketchybar --add item weather right \
           --set weather update_freq=1800 \
                         icon.padding_right=0 \
                         script="$PLUGIN_DIR/weather.sh" \
                         click_script="open 'https://wttr.in/'"
