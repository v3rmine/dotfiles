#!/bin/bash
## Consts
AUTO_CLEAN_TIME=72
TRASH="$HOME/.trash"

## Dynamic vars
timestamp=$(date +%s)

## Functions
moveToTrash() {
    # Test if ~/.trash exist
    # Move to .trash as name+timestamp
    [[ -e "$TRASH" ]] || mkdir "$TRASH"

    trashname=$(basename "$1")-$timestamp
    mv "$1" "$HOME/.trash/$trashname"
    realpath "$1" > "$TRASH/$trashname.meta"
    info "$1 was trashed!"
}
info() { echo -e "\e[32m[INFO]: $1\e[0m"; }
error() { echo -e "\e[31m[ERROR]: $1\e[0m"; }
display_help() {
    echo "=== Planchon Linux Simple Trash ==="
    echo
    echo "trash (-f | -rf) {file} => to remove without sending to the trash"
    echo "trash ( | -r) {file} => to send to the trash"
    echo "trash --empty => to clean the trash"
    echo "trash --auto-clean => to remove file trashed 3 days ago"
    echo "trash --restore {file-timestamp} => to restore a file or folder"
    echo 
}

## Main script
#count=0
#for arg in "$@"; do
#    count=count+1
if [ "$1" == "" ]; then # && "$count" == 0 ]; then
    display_help
elif [ "$1" == "-f" ]; then
    # Do not move to trash
    rm -f "$1"
elif [ "$1" == "-rf" ]; then
    # Do not move to trash
    rm -rf "$1"
elif [ "$1" == "--empty" ]; then
    # Empty trash
    rm -rf "$HOME/.trash/*"
elif [ "$1" == "--auto-clean" ]; then
    # Remove from trash files where time elapsed > AUTO_CLEAN_TIME (in hours)
    for f in "$TRASH"/*; do
        [[ -e "$f" ]] || break
        f_time=$(echo "$f" | sed -n -e 's/^.*-\([0-9]\+\)$/\1/p')
        if [ "$f_time" != "" ]; then
            if [ "$(echo "$f_time+$AUTO_CLEAN_TIME*3600" | bc)" -le "$timestamp" ]; then
                rm -rf "$f"
                rm -f "$f.meta"
            fi
        fi
    done
elif [ "$1" == "--restore" ]; then
    trashed="$TRASH/$(basename "$1")"

    if [[ -e "$trashed" ]]; then
        mv "$trashed" "$(cat "$trashed.meta")"
        rm -f "$trashed.meta"
    else
        error "$1 does not exist in trash!"
    fi
elif [[ -e "$1" ]]; then
    # Move to trash
    moveToTrash "$1"
else
    error "$(realpath "$1") does not exist!"
fi
