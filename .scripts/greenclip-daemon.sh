#!/bin/sh

# Only run the greenclip daemon once
if ps -eo 'tty,comm' | grep -q "^\?.*greenclip"; then
    exit 0
else
    exec greenclip daemon &
fi

exit 0
