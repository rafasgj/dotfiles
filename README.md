dotfiles
========

These are some configurations files I often use, and had to backup for
a system upgrade.

What better place to backup it and share than with Git and Github? ;-)


bashrc.d
--------

For `bash` configuration your `.bashrc` should have

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


packages
--------

The `packages` file is a list of packages to be installed. Use
`sudo xargs dnf -y install < packages`.


createlinks.sh
--------------

Create directories and links to configuration files and utilities.

