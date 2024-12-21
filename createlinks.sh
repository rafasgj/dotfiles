#!/bin/bash

BASEDIR="$(realpath $(dirname $0))"
CONFIGDIR="${BASEDIR}/config"

if [ -d "${HOME}/.bashrc.d" ]
then
    for script in $(ls -1 "${BASEDIR}/bashrc.d")
    do
        ln -snf "${BASEDIR}/bashrc.d/${script}" "${HOME}/.bashrc.d"
    done
else
    ln -snf "${BASEDIR}/bashrc.d" "${HOME}/.bashrc.d"
fi

directories=(
  "${HOME}/Applications"
  "${HOME}/.config"
)

for dir in ${directories[@]}
do
    [ -d "${dir}" ] || mkdir -p "${dir}"
done

ln -snf "${BASEDIR}/Applications/"* "${HOME}/Applications/"

for config in vimrc gitconfig zprofile zshrc
do
    ln -snf "${BASEDIR}/${config}" "${HOME}/.${config}"
done

for config in $(find ${CONFIGDIR} -maxdepth 1 | sed "s#${CONFIGDIR}##; /^ *$/d")
do
    ln -snf "${CONFIGDIR}/${config}" "${HOME}/.config/${config}"
done
