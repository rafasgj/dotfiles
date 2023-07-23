dotfiles
========

These are some configurations files I often use, and had to backup for
a system upgrade.

What a better place to backup it and share than with Git and Github? ;)


Software Install
----------------

The `software` directory contain list- of packages that should be
installed. Use `sed '/^#/d' < $FILENAME | sudo xargs dnf -y install`
to install the package list.


createlinks.sh
--------------

Script to create directories and links to configuration files and
utilities.


bashrc.d
--------

For `bash` configuration your `.bashrc` should have:

```sh
if [ -d ~/.bashrc.d ]
then
    for rc in $(find "${HOME)/.bashrc.d" -type f)
    do
        . "$rc"
    done
    unset rc
fi
```

