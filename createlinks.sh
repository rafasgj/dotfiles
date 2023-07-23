#!/bin/bash

BASEDIR="$(realpath $(dirname $0))"
CONFIGDIR="${BASEDIR}/config"

if [ -d "${HOME}/.bashrc.d" ]
then
    ln -snf "${BASEDIR}/bashrc.d/*" "${HOME}/.bashrc.d"
else
    ln -snf "${BASEDIR}/bashrc.d" "${HOME}/.bashrc.d"
fi

directories=(
  "${HOME}/Applications"
  "${HOME}/.config/xfce4/terminal"
  "${HOME}/.config/gtk-3.0"
)

for dir in ${directories[@]}
do
    [ -d "${dir}" ] || mkdir -p "${dir}"
done

ln -snf "${BASEDIR}/Applications/"* "${HOME}/Applications/"

for config in $(find ${CONFIGDIR} -type f | sed "s#${CONFIGDIR}##; /^ *$/d")
do
    ln -snf "${CONFIGDIR}/${config}" "${HOME}/.config/${config}"
done
