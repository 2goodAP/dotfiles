#
# A very simple script to set desktop background per user on the fly.
#

USER="$(whoami)"
LOG_FILE="/tmp/swaybg-$USER.log"

# `swaybg` Parameters
OUTPUT='*'
MODE='fill'
FALLBACK='#ffffff'
BACKGROUND="$HOME/Pictures/Wallpaper.jpg"

# Terminate already running swaybg instances.
killall -q swaybg

# Apply the background to the specified output.
swaybg --output=$OUTPUT --image=$BACKGROUND --mode=$MODE --color=$FALLBACK \
    2>&1 | tee -a $LOG_FILE & disown
