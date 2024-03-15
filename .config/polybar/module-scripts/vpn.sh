#!/bin/sh

if [[ $(nmcli | grep "connected to wireguard" | wc -c) -eq 0 ]];
then
    echo "%{F#66ffffff}󰌆"
else
    packet_loss=$( ping -w 1 archlinux.org 2>/dev/null | grep "0% packet loss" | wc -c )
    if [ $? -ne 0 ]; then
        echo "%{F#fff38ba8}󰌆"
    else
        if [[ "${packet_loss}" -eq 0 ]];
        then
            echo "%{F#fff38ba8}󰌆"
        else
            echo "󰌆"
        fi
    fi
fi

