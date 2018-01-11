<<<<<<< HEAD
include /etc/firejail/globals.local

caps.drop all

whitelist ${HOME}/Downloads
whitelist ${HOME}/VirtualBox_VMs
whitelist ${HOME}/.config/VirtualBox
whitelist ${HOME}/.gtkrc-2.0
whitelist ${HOME}/.gtkrc.mine
whitelist ${HOME}/.config/Trolltech.conf
=======
# Firejail profile for virtualbox
# This file is overwritten after every install/update
# Persistent local customizations
include /etc/firejail/virtualbox.local
# Persistent global definitions
include /etc/firejail/globals.local
>>>>>>> 7bf44969dff7201d9239c0a606510cc67ed688db

blacklist /boot
blacklist /media
blacklist /mnt
blacklist /opt

whitelist ${HOME}/.config/Trolltech.conf
whitelist ${HOME}/.config/VirtualBox
whitelist ${HOME}/.gtkrc-2.0
whitelist ${HOME}/.gtkrc.mine
whitelist ${HOME}/Downloads
whitelist ${HOME}/VirtualBox_VMs
whitelist /dev/dri
whitelist /dev/null
whitelist /dev/sdc
whitelist /dev/sdc1
whitelist /dev/vboxdrv
whitelist /dev/vboxdrvu
whitelist /dev/vboxnetctl
include /etc/firejail/whitelist-common.inc

caps.drop all
