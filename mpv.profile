ignore memory-deny-write-execute

# include ${HOME}/.config/firejail/mpv-relaxed.inc
include ${HOME}/.config/firejail/common.inc

whitelist ${HOME}/.config/mpv
whitelist ${DOWNLOADS}
whitelist ${VIDEOS}
whitelist ${MUSIC}
whitelist ${HOME}/POD

private-bin mpv
