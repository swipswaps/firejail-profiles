<<<<<<< HEAD
include /etc/firejail/globals.local

# Hack to automatically discard the lock file
=======
# Firejail profile for google-earth
# This file is overwritten after every install/update
# Persistent local customizations
include /etc/firejail/google-earth.local
# Persistent global definitions
include /etc/firejail/globals.local
>>>>>>> 7bf44969dff7201d9239c0a606510cc67ed688db

blacklist /boot
blacklist /media
blacklist /mnt

whitelist ${HOME}/.config/Google
whitelist ${HOME}/.googleearth/Cache/
whitelist ${HOME}/.googleearth/Temp/
whitelist ${HOME}/.googleearth/myplaces.backup.kml
whitelist ${HOME}/.googleearth/myplaces.kml
whitelist /tmp/.X11-unix
include /etc/firejail/whitelist-common.inc

caps.drop all
ipc-namespace
nogroups
noroot
seccomp
shell none

private-bin google-earth,sh,grep,sed,ls,dirname
private-dev
private-etc fonts,resolv.conf,X11,alternatives,pulse

noexec /home
noexec /tmp
