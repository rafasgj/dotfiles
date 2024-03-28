#!/bin/bash

target=${1:-work}

declare -A config
config=(
    ["work"]="-layout us -variant dvorak-alt-intl -option altwin:swap_lalt_lwin"
    ["game"]="br"
)

echo setxkbmap ${config[${target}]}
setxkbmap ${config[${target}]}
