#!/bin/sh

# Moon phase calculation using lunar cycle
# Reference: Known new moon date (January 6, 2000 18:14 UTC)
REFERENCE_NEW_MOON=947182440  # Unix timestamp for Jan 6, 2000 18:14 UTC
LUNAR_CYCLE=2551442.877      # Lunar cycle in seconds (29.53058867 days)

# Get current Unix timestamp
CURRENT_TIME=$(date +%s)

# Calculate days since reference new moon
SECONDS_SINCE_REF=$((CURRENT_TIME - REFERENCE_NEW_MOON))

# Find position in current lunar cycle (0-1)
CYCLE_POSITION=$(echo "scale=6; ($SECONDS_SINCE_REF % $LUNAR_CYCLE) / $LUNAR_CYCLE" | bc -l)

# Convert to phase (0-7 for 8 phases)
PHASE_NUM=$(echo "scale=0; $CYCLE_POSITION * 8" | bc -l)

# Handle rounding and convert to integer
PHASE_NUM=$(printf "%.0f" "$PHASE_NUM")
PHASE_NUM=$((PHASE_NUM % 8))

# Define moon phases with icons and names
case $PHASE_NUM in
    0) # New Moon
        ICON="󰽤"
        PHASE_NAME="New"
        ;;
    1) # Waxing Crescent
        ICON="󰽧"
        PHASE_NAME="Waxing Crescent"
        ;;
    2) # First Quarter
        ICON="󰽡"
        PHASE_NAME="First Quarter"
        ;;
    3) # Waxing Gibbous
        ICON="󰽨"
        PHASE_NAME="Waxing Gibbous"
        ;;
    4) # Full Moon
        ICON="󰽢"
        PHASE_NAME="Full"
        ;;
    5) # Waning Gibbous
        ICON="󰽦"
        PHASE_NAME="Waning Gibbous"
        ;;
    6) # Last Quarter
        ICON="󰽡"
        PHASE_NAME="Last Quarter"
        ;;
    7) # Waning Crescent
        ICON="󰽥"
        PHASE_NAME="Waning Crescent"
        ;;
    *) # Fallback
        ICON=""
        PHASE_NAME="Unknown"
        ;;
esac

# Calculate zodiac sign position
# Moon moves through all 12 signs in one lunar cycle (~29.53 days)
# Each sign gets about 2.46 days
ZODIAC_POSITION=$(echo "scale=6; $CYCLE_POSITION * 12" | bc -l)
ZODIAC_NUM=$(echo "scale=0; $ZODIAC_POSITION" | bc -l)
ZODIAC_NUM=$(printf "%.0f" "$ZODIAC_NUM")
ZODIAC_NUM=$((ZODIAC_NUM % 12))



# Define zodiac signs with symbols
case $ZODIAC_NUM in
    0) # Aries
        ZODIAC_ICON="󰩾"
        ZODIAC_NAME="Aries"
        ;;
    1) # Taurus
        ZODIAC_ICON="󰪇"
        ZODIAC_NAME="Taurus"
        ;;
    2) # Gemini
        ZODIAC_ICON="󰪁"
        ZODIAC_NAME="Gemini"
        ;;
    3) # Cancer
        ZODIAC_ICON="󰩿"
        ZODIAC_NAME="Cancer"
        ;;
    4) # Leo
        ZODIAC_ICON="󰪂"
        ZODIAC_NAME="Leo"
        ;;
    5) # Virgo
        ZODIAC_ICON="󰪈"
        ZODIAC_NAME="Virgo"
        ;;
    6) # Libra
        ZODIAC_ICON="󰪃"
        ZODIAC_NAME="Libra"
        ;;
    7) # Scorpio
        ZODIAC_ICON="󰪆"
        ZODIAC_NAME="Scorpio"
        ;;
    8) # Sagittarius
        ZODIAC_ICON="󰪅"
        ZODIAC_NAME="Sagittarius"
        ;;
    9) # Capricorn
        ZODIAC_ICON="󰪀"
        ZODIAC_NAME="Capricorn"
        ;;
    10) # Aquarius
        ZODIAC_ICON="󰩽"
        ZODIAC_NAME="Aquarius"
        ;;
    11) # Pisces
        ZODIAC_ICON="󰪄"
        ZODIAC_NAME="Pisces"
        ;;
    *) # Fallback
        ZODIAC_ICON="✦"
        ZODIAC_NAME="Unknown"
        ;;
esac

# Update sketchybar
sketchybar --set "$NAME" \
    icon="$ICON" \
    label="$PHASE_NAME in $ZODIAC_ICON"
