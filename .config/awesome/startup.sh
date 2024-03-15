#!/bin/bash

function run {
        if ! pgrep -f $1 ;
        then
            $@&
        fi
}

## Startup apps
picom &
killall -q polybar &

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

#MONITOR=${DP-1} polybar secondary &
if [[ $(xrandr -q | grep -w 'DP-1 connected') ]]; then
    xrandr --output eDP-1 --off &
    xrandr -r 75 &
    polybar secondary &
fi
if [[ $(xrandr -q | grep -w 'DP-1 disconnected') ]]; then
    xrandr --output eDP-1 --mode 1920x1080 --rate 70 &
    polybar main &
fi

# xbindkeys for shortcuts
run xbindkeys &
setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,ru &
source ~/.bashrc &
# start power manager
xfce4-power-manager &

