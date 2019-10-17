#!/bin/sh
sway &
sleep 3s # could be less
export XDG_RUNTIME_DIR=/run/user/1000
export WAYLAND_DISPLAY=wayland-0
export DISPLAY=:1
exec /usr/bin/swaylock
