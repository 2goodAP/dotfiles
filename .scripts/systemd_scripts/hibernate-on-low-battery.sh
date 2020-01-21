#!/bin/sh

acpi -b | awk -F'[,:%]' '{print $2, $3}' | {
	read -r status capacity

	if [ "$status" = Discharging -a "$capacity" -le 22 ]; then
		logger "Critical battery threshold"
		systemctl hibernate
	fi
}
