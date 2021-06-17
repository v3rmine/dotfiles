#!/bin/bash

echo Removing old profile file
rm "$HOME/.profile" || true

os=$(uname)
if [ "$os" = Darwin ]; then
    echo Linking os profile file
    ln -s "$PWD/profile.osx" "$HOME/.profile"

    echo Linking navi
    rm "$HOME/Library/Application Support/navi" || true
    ln -s "$PWD/navi" "$HOME/Library/Application Support/navi"

elif [ "$os" = Linux ]; then
    echo Linking os profile file
    ln -s "$PWD/profile.lux" "$HOME/.profile"

    echo Linking navi
    rm "$HOME/.local/share/navi" || true
    ln -s "$PWD/navi" "$HOME/.local/share/navi"
fi
