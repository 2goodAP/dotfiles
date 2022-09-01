#
# A very simple script to set desktop background per user on the fly.
#

OUTPUT='*'
MODE='fill'
FALLBACK='#ffffff'

case $(whoami) in
    aashishp)
        BACKGROUND="$HOME/Pictures/Wheat_Field_Windmill.jpg"
        ;;
    workerap)
        BACKGROUND="$HOME/Pictures/Sunny_Mountain_Landscape.jpg"
        ;;
esac

# Terminate already running swaybg instances.
killall -q swaybg

# Apply the background to the specified output.
swaybg --output=$OUTPUT --image=$BACKGROUND --mode=$MODE --color=$FALLBACK \
    &>> "/tmp/swaybg-$(whoami).log" & disown
