#!/bin/sh

if ps -eo 'comm' | grep -q '^redshift$'; then
    exec pkill -9 redshift
else
    exec redshift &
fi

exit 0
