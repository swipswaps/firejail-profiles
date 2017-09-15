# Firejail profile for darktable
# This file is overwritten after every install/update
# Persistent local customizations
include /etc/firejail/darktable.local
# Persistent global definitions
include /etc/firejail/globals.local

blacklist /boot
blacklist /media
blacklist /mnt
blacklist /opt
blacklist /usr/local/bin

whitelist ${HOME}/.cache/darktable
whitelist ${HOME}/.config/darktable
whitelist ${HOME}/Downloads
whitelist ${HOME}/Pictures
whitelist /tmp/.X11-unix
include /etc/firejail/whitelist-common.inc

caps.drop all
ipc-namespace
net none
nogroups
noroot
nosound
seccomp
shell none

private-bin darktable
private-dev
private-etc fonts,X11,alternatives

noexec ${HOME}
noexec /tmp
