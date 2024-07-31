#!/bin/bash

# when a new file is created in the watched directory,
# it will be renamed to a number (extension won't change)
# that represents the number of files in the directory
# e.g. first file created will be renamed to 1.png

WATCH_DIR="/home/gusalbukrk/Pictures/Screenshots"

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

inotifywait -m -e create --format '%w%f' "$WATCH_DIR" | while read NEW_FILE
do
  on_new_file "$NEW_FILE"
done