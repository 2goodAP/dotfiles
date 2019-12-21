#!/bin/bash

# Example notifier script -- lowers screen brightness, then waits to be killed
# and restores previous brightness on exit.

## CONFIGURATION ##############################################################

# Brightness program to use
brightness_program=/usr/bin/brightnessctl

# Brightness will be lowered to this value.
min_brightness=3000

# If your video driver works with $brightness_program, set -time and -steps for fading
# to $min_brightness here. Setting steps to 1 disables fading.
fade_time=200
fade_steps=20

# If you have a driver without RandR backlight property (e.g. radeon), set this
# to use the sysfs interface and create a .conf file in /etc/tmpfiles.d/
# containing the following line to make the sysfs file writable for group
# "users":
#
#     m /sys/class/backlight/acpi_video0/brightness 0664 root users - -
#
#sysfs_path=/sys/class/backlight/acpi_video0/brightness

# Time to sleep (in seconds) between increments when using sysfs. If unset or
# empty, fading is disabled.
fade_step_time=0.05

###############################################################################

get_brightness() {
    if [[ -z $sysfs_path ]]; then
        bri=$($brightness_program get)
        python3 -c "from math import ceil; print(ceil($bri))"
    else
        cat $sysfs_path
    fi
}

set_brightness() {
    if [[ -z $sysfs_path ]]; then
        $brightness_program set $1 --quiet
    else
        echo $1 > $sysfs_path
    fi
}

fade_brightness() {
    if [[ -z $sysfs_path ]]; then
        $brightness_program set $1 --quiet
    elif [[ -z $fade_step_time ]]; then
        set_brightness $1
    else
        local level
        for level in $(eval echo {$(get_brightness)..$1}); do
            set_brightness $level
            sleep $fade_step_time
        done
    fi
}

trap 'exit 0' TERM INT
trap "set_brightness $(get_brightness); kill %%" EXIT
fade_brightness $min_brightness
sleep 2147483647 &
wait
