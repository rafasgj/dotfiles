#!/bin/bash

join_off_list() {
   first="${1-}"
   shift 1 2>/dev/null && printf -- "%s" "--output ${first}" "${@/#/ --off --output }" " --off"
}

off_list=($(xrandr | grep "disconnected" | cut -d " " -f 1 | sort))
display_list=($(xrandr | grep "[^s]connected" | cut -d " " -f 1 | sort ))

echo "OFF: ${off_list[@]}"
echo "ON: ${display_list[@]}"

[[ " ${display_list[@]} " =~ " eDP-1 " ]] && main="eDP-1" || main="${display_list[0]}"
declare -a secondary
for d in ${display_list[@]}; do
    [ "${d}" == "${main}" ] || secondary+=( "${d}" )
done
echo "MAIN: ${main}"
echo "SECONDARY: ${secondary[@]}"

xrandr $(join_off_list "${off_list[@]}") $(join_off_list "${display_list[@]}")

echo "Setting ${#display_list[@]} monitor(s): ${display_list[@]}"
case ${#display_list[@]} in
    1)
        xrandr --output ${display_list[0]} --auto
    ;;
    2)
        [[ " ${display_list[*]} " =~ " HDMI" ]] && position="--above" || position="--left-of"
        xrandr --output ${main} --auto --output ${secondary[0]} --auto ${position} ${main}
    ;;
    3)
        xrandr --output ${main} --auto --output ${secondary[1]} --auto --above ${main} --output ${secondary[0]} --auto --left-of ${secondary[1]}
    ;;
esac

