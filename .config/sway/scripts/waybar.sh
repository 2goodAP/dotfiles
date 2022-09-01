#
# A very simple script to hard restart waybar.
#

# Terminate already running Waybar instances.
killall -q waybar

echo "---" >> "/tmp/waybar-$(whoami).log"

# Launch Waybar using the default config.
waybar &>> "/tmp/waybar-$(whoami).log" & disown
