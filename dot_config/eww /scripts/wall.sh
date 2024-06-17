#!/bin/bash

DIR="$HOME/Pictures/"
PICS=("$DIR"/*)  # Store file paths in an array

# Check if the directory is empty
if [ ${#PICS[@]} -eq 0 ]; then
    echo "No images found in $DIR"
    exit 1
fi

# Check if last index is stored in a file, default to -1 if not found
LAST_INDEX_FILE="$DIR/last_index.txt"
if [ -f "$LAST_INDEX_FILE" ]; then
    LAST_INDEX=$(<"$LAST_INDEX_FILE")
else
    LAST_INDEX=-1
fi

# Increment index or reset to 0 if reached the end
NEXT_INDEX=$(( (LAST_INDEX + 1) % ${#PICS[@]} ))

# Store the next index
echo "$NEXT_INDEX" > "$LAST_INDEX_FILE"

# Get the next image path
NEXT_PIC="${PICS[$NEXT_INDEX]}"

# Check if swaybg is running and kill it
if pidof swaybg > /dev/null; then
  pkill swaybg
fi

# Initialize or query swww
swww query || swww-daemon --format xrgb

# Change wallpaper using swww
swww img "$NEXT_PIC" --transition-fps 30 --transition-type any --transition-duration 3

