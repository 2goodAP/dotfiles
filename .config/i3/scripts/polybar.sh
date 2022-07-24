# Terminate already running ipc-enabled bar instances.
polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
polybar top 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
