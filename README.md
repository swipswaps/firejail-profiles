# firejail-profiles
Tight Firejail profiles

This is a collection of tighter firejail (https://github.com/netblue30/firejail) profiles for certain applications. These may or may not work on your computer since some of them use seccomp filters, which may depend on architecture and OS. These were designed on Debian sid/experimental x86_64.

I am slowly switching the profiles to use a `common.inc` file so that maintenance becomes easier and I cut down on duplicate stuff.

Just a note: I would highly recommend using `systemd` to sandbox system processes. I personally do not use `firejail` to sandbox system processes since I'm using `systemd` to start the process anyway (so it's easier to use the sandboxing capabilities of `systemd` itself).

## Utilities

Currently there is one utility file in this repository: `gen_libraries`. `gen_libraries` is a collection of `bash` functions which helps dynamically resolve the libraries needed by a program in a more powerful way than the built-in one shipped with `firejail`. Most pertinently, it allows passing a folder as the first argument, in which case it will use `find` to locate all files within the folder and run `ldd` on each of them. This makes it easier, say, to compile a list for `firefox`.

An example script, `private-profile.sh`, which makes use of `gen_libraries` is provided in this repository as well. `private-profile.sh` makes it easy to generate a temporary profile for an application (usually a browser) and run the application with that profile. There are five possible arguments to the script. Positional arguments come at the end. The arguments are as follows:

* The only positional argument is the path to a `.private` file. `.private` files define several application-specific variables which are used later in the script. More on this below.
* `-p` is the path to an existing profile. This will be used in certain circumstances.
* `-t` toggles whether the script should create a temporary profile.
* `-c` toggles whether the script should copy certain files or folders from the existing profile to the temporary profile.
* `-n` enables a network namespace on the given interface.

A `.private` file defines several application-specific variables. The following variables are recognized:

* `$privlib` enables the dynamic generation of a `private-lib` filter. If enabled, the following variables should be defined:
  * `$genlib` is the path to the `gen_libraries` path. 
  * `$libdir` is the path to the application's lib folder.
  * `$extralibs` [optional] is the list of hard-coded libraries which are not automatically detected. Can be left unset if no hard-coded libraries are required.
* `$use_systemd` enables `systemd` integration.
* `$use_firejail` enables `firejail` integration.
* `$profiledir` is the path to the directory where profiles are stored.
* `$tocopy` is the list of files to copy to the temporary profile.
* `$destdir` [optional] is the directory to generate inside the temporary profile directory. If set to `""` or unset, then the temporary directory itself is treated as the profile.
* `$progname` is the command to run.
* `$progargs` is the array of arguments to pass when the program is not already running.
* `$rprogargs` is the array of arguments to pass when the program is already running.
* `$envvars` [optional] is a bash array used for setting any environment variables (now uses `firejail`'s environment handling!). If set to an empty array (`()`) or unset, no extra environment variables are passed along.

There are two example `.private` files in this repo, `private-profiles/firefox.private` and `private-profiles/chromium.private`.

Another example script, `dropbox`, is also provided which uses `gen_libraries` to dynamically generate the library dependencies needed to get `dropbox` working with a `private-lib` filter.

Yet another example script, `google-earth-pro`, is provided which uses `gen_libraries` to dynamically generate the library dependencies needed to get `google-earth-pro` working with a `private-lib` filter. Also note that due to some issues with `google-earth-pro`, the script manually removes the lock file generated by Google Earth after quitting.

## Profiles

List of currently-supported programs:
* Ardour 5
* Akregator
* aMule
* Blender
* Brackets
* BRL-CAD (experimental) - use the generator script `brlcad-gen.sh` to generate aliased profiles and setup the `private-bin` predicate.
* calcurse
* Calligra
* Darktable
* Dia
* Discord
* Dropbox
* ELinks
* Feh
* Fetchmail
* Firefox (regular and ESR)
* Flameshot
* Flowblade
* Fontforge
* FreeCAD
* Geany
* Gerbera
* GIMP
* Git
* Google Chrome
* Google Earth Pro
* Gradio
* Hugin
* ImageJ
* Inkscape
* Kdenlive
* Libreoffice
* Linphone
* LMMS
* Luminance HDR
* Macrofusion
* Matlab
* Messenger For Desktop
* MPD
* mps-youtube (mpsyt)
* MPV
* MuPDF
* Mutt
* Natron (thanks @triceratops1!)
* Newsboat
* OpenShot
* Opera
* Pidgin
* ping
* Qemu (VMs should be stored in `${HOME}/qemu-vms` or edit `qemu-system-common.profile` to whitelist the folder you store your VMs in) - profiles included for `qemu-system-{i386,x86_64}`, but you can create your own by building off of `qemu-system-common.profile`
* QPDFView
* Ricochet
* rtv
* Scribus
* Scrot
* Shotcut
* Signal Desktop
* Skype
* Slack Desktop
* SSH
* Synfig Studio
* Telegram Desktop
* Tor Browser Bundle (through the torbrowser-launcher package on Debian)
* Tor Browser profile for Arch (thanks @robotanarchy!)
* Viber
* Viewnior
* Virtualbox
* Generic terminal emulator (the profile is called x-terminal-emulator because of the /etc/alternatives system in Debian)
* Xfburn
* Youtube-dl
* Zart (thanks @triceratops1!)
