#!/bin/sh
# Script for initiating swaylock
export XDG_RUNTIME_DIR=/run/user/$UID
export WAYLAND_DISPLAY=wayland-0
export DISPLAY=:0
exec /usr/bin/swaylock
