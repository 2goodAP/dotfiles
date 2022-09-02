#
# A very simple script to set desktop background per user on the fly.
#

USER="$(whoami)"
LOG_FILE="/tmp/swaybg-$USER.log"

# `swaybg` Parameters
OUTPUT='*'
MODE='fill'
FALLBACK='#ffffff'

case $USER in
    aashishp)
        BACKGROUND="$HOME/Pictures/Wheat_Field_Windmill.jpg"
        ;;
    workerap)
        BACKGROUND="$HOME/Pictures/Sunny_Mountain_Landscape.jpg"
        ;;
    *)
        echo "swaybg.sh: error: Unrecogonized user '$USER'" | tee -a $LOG_FILE
        exit 1
        ;;
esac

# Terminate already running swaybg instances.
killall -q swaybg

# Apply the background to the specified output.
swaybg --output=$OUTPUT --image=$BACKGROUND --mode=$MODE --color=$FALLBACK \
    2>&1 | tee -a $LOG_FILE & disown
