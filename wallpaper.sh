#!/bin/bash
WALLPAPERS="$HOME/Images/Wallpapers"

IMAGE=$(find "$WALLPAPERS" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | shuf -n 1)

feh --bg-fill "$IMAGE"

wallust run "$IMAGE"
