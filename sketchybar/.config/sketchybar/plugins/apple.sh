#!/bin/sh

# Apple logo power menu for sketchybar
# Shows power options when clicked

# Create a simple power menu using osascript (AppleScript)
# This provides a native macOS dialog with power options

osascript <<EOF
set powerOptions to {"Sleep", "Restart", "Shutdown", "Lock Screen", "Cancel"}
set chosenOption to choose from list powerOptions with title "Power Options" with prompt "Choose an action:" default items {"Cancel"}

if chosenOption is not false then
    set selectedOption to item 1 of chosenOption
    
    if selectedOption is "Sleep" then
        do shell script "pmset sleepnow"
    else if selectedOption is "Restart" then
        do shell script "sudo shutdown -r now" with administrator privileges
    else if selectedOption is "Shutdown" then
        do shell script "sudo shutdown -h now" with administrator privileges
    else if selectedOption is "Lock Screen" then
        tell application "System Events" to keystroke "q" using {control down, command down}
    end if
end if
EOF 