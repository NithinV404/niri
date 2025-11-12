#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/wallpapers"

# Find a random wallpaper (supports jpg, png, jpeg)
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \) | shuf -n 1)

if [ -z "$WALLPAPER" ]; then
    echo "No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

# Set the wallpaper with swww (fade transition)
swww img "$WALLPAPER" --transition-type fade --transition-duration 1

# Update the theme based on the new wallpaper
~/.config/niri/scripts/update-theme.sh

echo "Wallpaper changed to: $WALLPAPER"
