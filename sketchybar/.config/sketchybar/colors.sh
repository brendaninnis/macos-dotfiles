#!/usr/bin/env sh

# Base Catppuccin Mocha Colors
BLACK=0xff1e1e2e
GRAY=0xff6c7086
WHITE=0xffcdd6f4
RED=0xfff38ba8
GREEN=0xffa6e3a1
BLUE=0xff89b4fa
YELLOW=0xfff9e2af
ORANGE=0xfffab387
PINK=0xfff5c2e7
PURPLE=0xffcba6f7
TEAL=0xff94e2d5

# Background Colors
BG_PRI=$BLACK             # Primary background (base) - Using BLACK
BG_SEC=0xff313244         # Secondary background (surface0)
BG_TER=0xff45475a         # Tertiary background (surface1)

# Semantic Status Colors
SUCCESS=$GREEN            # Green - for positive states
WARNING=$YELLOW           # Yellow - for warning states
ERROR=$RED                # Red - for error states
INFO=$BLUE                # Blue - for info states

# UI Element Colors
ACCENT=$BLUE              # Primary accent (blue)
ACCENT_ALT=$PURPLE        # Alternative accent (purple)
BORDER=$GRAY              # Border color (overlay0) - Using GRAY
INACTIVE=$GRAY            # Inactive elements - Using GRAY
ACTIVE=$WHITE             # Active text/icons - Using WHITE

# Transparency Variants
BG_PRI_TRANS=0x88313244   # Semi-transparent backgrounds
BG_SEC_TRANS=0x88585b70   # For floating elements
BORDER_TRANS=0x44ffffff   # Subtle borders

# Item-specific semantic colors
BATTERY_LOW=$RED          # Red for low battery
BATTERY_MED=$YELLOW       # Yellow for medium battery
BATTERY_HIGH=$GREEN       # Green for high battery
BATTERY_CHARGING=$BLUE    # Blue for charging

WIFI_CONNECTED=$GREEN     # Green for connected
WIFI_DISCONNECTED=$RED    # Red for disconnected
WIFI_WEAK=$YELLOW         # Yellow for weak signal

MOON_COLOR=$YELLOW        # Moon icon color
