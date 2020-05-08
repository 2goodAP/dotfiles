#!/bin/sh

# Terminate already running bar instances
killall -q waybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch Waybar
echo "---" | tee -a /tmp/waybar.log

waybar >>/tmp/waybar.log 2>&1 &

echo "Bars launched..."
