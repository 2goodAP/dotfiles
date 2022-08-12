# Terminate already running bar instances
killall -q waybar

echo "---" | tee -a /tmp/waybar.log

# Launch Waybar using the default config.
waybar 2>&1 | tee -a /tmp/waybar.log & disown
