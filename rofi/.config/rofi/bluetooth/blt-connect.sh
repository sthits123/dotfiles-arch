#!/usr/bin/env bash

# Check if Bluetooth powered on
if bluetoothctl show | grep -q "Powered: yes"; then
    # Bluetooth icon (you can customize with any icon font or SVG)
    icon=""

    # List connected paired devices' names (comma separated)
    devices=$(bluetoothctl devices Paired 2>/dev/null | awk '{print $2}' | while read -r mac; do
        if bluetoothctl info "$mac" | grep -q "Connected: yes"; then
            bluetoothctl info "$mac" | grep "Alias" | cut -d ' ' -f 2-
        fi
    done | paste -sd ", " -)

    if [ -n "$devices" ]; then
        echo "$icon $devices"
    else
        echo "$icon (no device)"
    fi
else
    # Bluetooth off icon
    echo " Off"
fi

