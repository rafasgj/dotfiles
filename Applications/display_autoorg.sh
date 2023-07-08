#!/bin/bash

join_list() {
   first="${1-}"
   shift 1 2>/dev/null && printf -- "%s" "--output ${first}" "${@/#/ --off --output }" " --off"
}

off_list=($(xrandr | grep " disconnected" | cut -d " " -f 1))
display_list=($(xrandr | grep " connected" | cut -d " " -f 1))

xrandr $(join_list "${off_list[@]}") $(join_list "${display_list[@]}")

case ${#display_list[@]} in
    1)
        echo "Setting monitor: ${display_list[0]}"
        xrandr --output ${display_list[0]} --auto
    ;;
    2)
        echo "Setting 2 monitors: ${display_list[@]}"
        if [ " ${disaplay_list[*]} " =~ " HMDI-1 " ]
        then
            xrandr --output eDP-1 --auto --output HDMI-1 --above eDP-1
        else
            xrandr --output eDP-1 --auto --output DP-2 --left-of eDP-1
        fi
    ;;
    3)
        echo "Setting 3 monitors: ${display_list[@]}"
        xrandr --output eDP-1 --auto --output HDMI-1 --auto --above eDP-1 --output DP-2 --auto --left-of HDMI-1
    ;;
esac

