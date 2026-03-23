#!/bin/zsh

#
# -- Alacritty Window Title --
#

terminal_title_preexec() {
    # print -Pn -- "\e]2;${(q)1}\a"
    print -Pn -- "\e]2;%n@%m -- %~ -- ${(q)1}\a"
}

terminal_title_precmd() {
    print -Pn -- '\e]2;%n@%m -- %~\a'
}

# Title hooks
declare -a precmd_functions
declare -a preexec_functions

[[  " terminal_title_precmd " =~ " ${precmd_functions[*]} " ]] || precmd_functions+=(terminal_title_precmd)
[[  " terminal_title_preexec " =~ " ${preexec_functions[*]} " ]] || preexec_functions+=(terminal_title_preexec)

#
# --- Show Git branch on prompt ---
#
parse_git_branch() {
    branch="$(git symbolic-ref --short HEAD 2>/dev/null)"
    [ -n "${branch}" ] && echo -n "(${branch}) "
}

setopt PROMPT_SUBST

PROMPT='%F{white}%B%n@%m%f %F{cyan}$(parse_git_branch)%f%b%F{green}%1~%f\$ '

alias virt-manager='virt-manager -c "qemu:///session" --no-fork &'
alias ls='ls --color'

PATH="$PATH:${HOME}/Applications"
