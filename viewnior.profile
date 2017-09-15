# Firejail profile for viewnior
# This file is overwritten after every install/update
# Persistent local customizations
include /etc/firejail/viewnior.local
# Persistent global definitions
include /etc/firejail/globals.local


whitelist ${DOWNLOADS}
whitelist ${HOME}/.config/viewnior
whitelist ${HOME}/.gtkrc-2.0
whitelist ${HOME}/.themes
whitelist ${HOME}/Pictures
include /etc/firejail/whitelist-common.inc

caps.drop all
ipc-namespace
net none
nogroups
nonewprivs
noroot
seccomp
shell none

private-bin viewnior
private-dev
private-etc fonts
private-tmp

noexec ${HOME}
noexec /tmp
