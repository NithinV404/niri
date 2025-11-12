#!/bin/bash

# Get current wallpaper path from swww
WALLPAPER=$(swww query | awk -F': ' '{print $6}' | head -1)

if [ -z "$WALLPAPER" ] || [ ! -f "$WALLPAPER" ]; then
    echo "No valid wallpaper found."
    exit 1
fi

# Generate Material You colors using matugen (dark mode) and apply templates
matugen image "$WALLPAPER" -m dark --config ~/.config/matugen/config.toml

echo "Theme updated based on wallpaper: $WALLPAPER"
