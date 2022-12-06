#
# A very simple script to launch swaylock with custom settings.
#

LOG_FILE="/tmp/swaylock-${USER}.log"

# Background Image
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
USER="$(whoami)"
BACKGROUND="${SCRIPT_DIR}/../images/${USER}_lockscreen.jpg"

# Colors
BLUE=1c71d8ff
GREEN=2ec27eff
PRIMARY=fafafaff
RED=e01b24ff
SECONDARY=c0bfbcff
TRANSPARENT=24242400
YELLOW=e5a50aff

# Swaylock Command
swaylock --daemonize --ignore-empty-password --image ${BACKGROUND} \
    --scaling fill --indicator-radius 80 --indicator-thickness 15 \
    --indicator-caps-lock --disable-caps-lock-text \
    --key-hl-color ${GREEN} --bs-hl-color ${RED} --separator-color ${PRIMARY} \
    --inside-color ${TRANSPARENT} --inside-clear-color ${TRANSPARENT} \
    --inside-caps-lock-color ${TRANSPARENT} --inside-ver-color ${TRANSPARENT} \
    --inside-wrong-color ${TRANSPARENT} \
    --line-color ${PRIMARY} --line-clear-color ${PRIMARY} \
    --line-caps-lock-color ${PRIMARY} --line-ver-color ${PRIMARY} \
    --line-wrong-color ${PRIMARY} \
    --ring-color ${PRIMARY} --ring-clear-color ${SECONDARY} \
    --ring-caps-lock-color ${YELLOW} --ring-ver-color ${BLUE} \
    --ring-wrong-color ${RED} \
    --text-color ${PRIMARY} --text-clear-color ${TRANSPARENT} \
    --text-caps-lock-color ${PRIMARY} --text-ver-color ${TRANSPARENT} \
    --text-wrong-color ${TRANSPARENT} 2>&1 | tee -a ${LOG_FILE} & disown
