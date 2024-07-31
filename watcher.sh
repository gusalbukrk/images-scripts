#!/bin/bash

# Directory to watch
WATCH_DIR="/home/gusalbukrk/Pictures/Screenshots"

# Command to execute when a new file is created
on_new_file() {
  FILE="$1"
  echo "New file created: $FILE"

  FILE_COUNT=$(find "$WATCH_DIR" -maxdepth 1 -type f | wc -l)
  EXT="${FILE##*.}"
  NEW_FILE_PATH="$WATCH_DIR/$FILE_COUNT.$EXT"
  
  echo $FILE_COUNT
  echo $EXT
  mv "$FILE" "$NEW_FILE_PATH"
  echo "File renamed to: $NEW_FILE_PATH"
}

# Start watching the directory
inotifywait -m -e create --format '%w%f' "$WATCH_DIR" | while read NEW_FILE
do
  on_new_file "$NEW_FILE"
done