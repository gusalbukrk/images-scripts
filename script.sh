#!/bin/bash

SDIR="/home/gusalbukrk/Pictures/Screenshots"

while IFS= read -r -u 3 line || [ -n "$line" ]; do
    echo "$line"
    google-chrome "$line" > /dev/null 2>&1 &

    read -n 1 response

    response=${response:-y}

    if [[ "$response" != "y" && "$response" != "n" ]]; then
        echo "Error: Invalid response. Only 'y' or 'n' are allowed."
        exit 1
    fi

    problemPath=$(echo "$line" | awk -F'/' '{print $(NF-3)"/"$(NF-2)"/"$(NF-1)"/"$NF}' | sed 's/\.[^.]*$//')

    IMGSDIR="./imgs/$problemPath"
    mv "$SDIR"/* "$IMGSDIR"/

    # echo "$line $response" >> output.txt

    # sed -i -e '1d' input.txt
done 3< input.txt
