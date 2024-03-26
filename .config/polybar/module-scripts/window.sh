#!/bin/bash

get_active_window_class() {
    xprop -id $(xdotool getactivewindow) | awk '/WM_CLASS/{print $4}'
}

current_window_class=$(get_active_window_class)

if [ -n "$current_window_class" ]; then
    app_name=$(echo "$current_window_class" | awk -F '"' '{print $2}')
    echo "  $app_name"
fi
