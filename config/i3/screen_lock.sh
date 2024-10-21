#!/bin/sh

fix_cmd() {
    setxkbmap -option altwin:swap_lalt_lwin
}

if [ "${1}" == "-lock" ]
then
    trap fix_cmd HUP INT TERM
    i3lock --nofork
    fix_cmd
else
    fix_cmd
fi

