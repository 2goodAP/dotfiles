#
# A very simple script to set desktop background per user on the fly.
#

LOG_FILE="/tmp/swaybg-${USER}.log"

# `swaybg` Parameters
OUTPUT='*'
MODE='fill'
FALLBACK='#ffffff'

# Background Image
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
USER="$(whoami)"
BACKGROUND="${SCRIPT_DIR}/../images/${USER}_desktop.jpg"

# Terminate already running swaybg instances.
killall -q swaybg

# Apply the background to the specified output.
swaybg --output=${OUTPUT} --image=${BACKGROUND} --mode=${MODE} \
    --color=${FALLBACK} 2>&1 | tee -a ${LOG_FILE} & disown
