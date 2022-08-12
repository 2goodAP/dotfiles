# Background Image Path
BACKGROUND_IMG="~/Pictures/Mountain_Pass_Horizon.jpg"

# Colors
BLUE=0087afff
GREEN=008700ff
PRIMARY=eeeeeeff
RED=af0000ff
SECONDARY=bcbcbcff
TRANSPARENT=44444400
YELLOW=ffaf00ff

# Swaylock Command
swaylock --daemonize --ignore-empty-password --image $BACKGROUND_IMG \
    --scaling fill --effect-blur 10x1 --effect-vignette 0.75:0.75 \
    --indicator --indicator-radius 80 --indicator-thickness 15 \
    --indicator-caps-lock --disable-caps-lock-text \
    --clock --timestr '%I:%M %p' --datestr '%a, %b %d, %Y' \
    --key-hl-color $GREEN --bs-hl-color=$RED --separator-color=$PRIMARY \
    --inside-color $TRANSPARENT --inside-clear-color $TRANSPARENT \
    --inside-caps-lock-color $TRANSPARENT --inside-ver-color $TRANSPARENT \
    --inside-wrong-color $TRANSPARENT \
    --line-color $PRIMARY --line-clear-color $PRIMARY \
    --line-caps-lock-color $PRIMARY --line-ver-color $PRIMARY \
    --line-wrong-color $PRIMARY \
    --ring-color $PRIMARY --ring-clear-color $SECONDARY \
    --ring-caps-lock-color $YELLOW --ring-ver-color $BLUE \
    --ring-wrong-color $RED \
    --text-color $PRIMARY --text-clear-color $TRANSPARENT \
    --text-caps-lock-color $PRIMARY --text-ver-color $TRANSPARENT \
    --text-wrong-color $TRANSPARENT
