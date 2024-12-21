#!/bin/zsh

parse_git_branch() {
    branch="$(git symbolic-ref --short HEAD 2>/dev/null)"
    [ -n "${branch}" ] && echo -n "(${branch}) "
}

setopt PROMPT_SUBST

PROMPT='%F{white}%B%n@%m%f %F{cyan}$(parse_git_branch)%f%b%F{green}%1~%f\$ '

alias virt-manager='virt-manager -c "qemu:///session" --no-fork &'
alias ls='ls --color'

PATH="$PATH:${HOME}/Applications"
