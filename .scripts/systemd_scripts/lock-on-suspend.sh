#!/bin/sh
# Script for initiating lock program
export DISPLAY=:0
export XDG_RUNTIME_DIR=/run/user/$UID

if ls /run/user/$UID | grep -q 'wayland'; then
    export WAYLAND_DISPLAY=wayland-0
    exec /usr/bin/swaylock
else
    exec /usr/bin/betterlockscreen --suspend dimblur
fi
