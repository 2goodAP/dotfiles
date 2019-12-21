#!/bin/sh
# Script for initiating lock program
export DISPLAY=:0

if ls /run/user/$UID | grep -q 'wayland'; then
    export XDG_RUNTIME_DIR=/run/user/$UID
    export WAYLAND_DISPLAY=wayland-0
    exec /usr/bin/swaylock
else
    exec /usr/bin/betterlockscreen --suspend dimblur
fi
