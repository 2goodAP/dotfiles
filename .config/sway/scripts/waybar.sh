#
# A very simple script to hard restart waybar.
#

LOG_FILE="/tmp/waybar-$(whoami).log"

# Terminate already running Waybar instances.
killall -q waybar

echo "---" | tee -a $LOG_FILE

# Launch Waybar using the default config.
waybar 2>&1 | tee -a $LOG_FILE & disown
