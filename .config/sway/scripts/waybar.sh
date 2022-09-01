#
# A very simple script to hard restart waybar.
#

LOG_FILE="/tmp/waybar-$(whoami).log"

# Terminate already running Waybar instances.
killall -q waybar

echo "---" >> $LOG_FILE

# Launch Waybar using the default config.
waybar &>> $LOG_FILE & disown
