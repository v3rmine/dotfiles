#!/bin/bash

echo Removing old profile file
rm "$HOME/.profile" || true

os=$(uname)
if [ "$os" = Darwin ]; then
    echo Linking os profile file
    ln -s "$PWD/profile.osx" "$HOME/.profile"

elif [ "$os" = Linux ]; then
    echo Linking os profile file
    
    user=$(whoami)
    if [ "$user" = johan.planchon ]; then
	ln -s "$PWD/no-perms.lux" "$HOME/.profile"
    else
    	ln -s "$PWD/profile.lux" "$HOME/.profile"
    fi
fi
