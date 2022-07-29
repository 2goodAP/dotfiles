THEME=light
ORIGINAL_IMG=~/Pictures/Mountain_Pass_Horizon.jpg
BACKGROUND_IMG=~/.config/i3/images/i3lock_background.jpg


function _blur_background {
    if [ ! -f "$1" ] || [[ ! "$1" == *".jpg" && ! "$1" == *".png" ]]; then
        echo "i3lock.sh: '$1', invalid image file. Either the file does not exist or is not a .jpg or .png image."
        exit -2
    fi

    if [ ! -d "$(dirname $2)" ]; then
        mkdir "$(dirname $2)"
    fi

    if [ ! -f $2 ] || [ $1 -nt $2 ]; then
        vips --vips-concurrency=2 gaussblur $1 $2 10
    fi
}


_blur_background $ORIGINAL_IMG $BACKGROUND_IMG

case "$THEME" in
    light)
        BLUE=689d6aff
        DATETIME=fbf1c7ff
        GREEN=98971aff
        PRIMARY=fbf1c7ff
        RED=cc241dff
        SECONDARY=3c383600
        YELLOW=d79921ff
        ;;
    dark)
        BLUE=689d6aff
        DATETIME=282828ff
        GREEN=98971aff
        PRIMARY=282828ff
        RED=cc241dff
        SECONDARY=ebdbb200
        YELLOW=d79921ff
        ;;
    *)
        echo "i3lock.sh: unrecogonized theme '$THEME'."
        usage
        exit -1
esac

i3lock-color --nofork --ignore-empty-password \
    --pass-{media,screen,power}-keys \
    --image=$BACKGROUND_IMG --scale \
    --indicator --radius=50 --ind-pos="w/2:h/2+r" --line-color=$SECONDARY \
    --keyhl-color=$GREEN --bshl-color=$RED --separator-color=$PRIMARY \
    --inside-color=$SECONDARY --inside{ver,wrong}-color=$SECONDARY \
    --ring-color=$PRIMARY --ringver-color=$BLUE --ringwrong-color=$RED \
    --force-clock --time-pos="ix:iy-400" \
    --time-str="%r" --date-str="%A, %b %d, %Y" \
    --time-color=$DATETIME --time-size=48 \
    --date-color=$DATETIME --date-size=30 \
    --greeter-text="$(whoami)" --greeter-pos="ix:iy-80" \
    --greeter-color=$PRIMARY --greeter-size=36 \
    --modif-color=$YELLOW --modifoutline-color=$YELLOW --modifieroutline-width=1 \
    --lockfailed-text="" --lock-text="" \
    --noinput-text="" --wrong-text="" --verif-text=""
