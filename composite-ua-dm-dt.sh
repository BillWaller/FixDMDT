#!/bin/bash
# 09-run.sh
# reconstruct displaymanager and desktop links and
# entries using update-alternatives
#
# This file was constructed by hand and is not a generated script.
# It merely consolidates scripts 01 through 08 into a single script for ease of
# use. It is just an example of how to use update-alternatives to manage
# displaymanagers and desktop sessions. It is not intended to be used as is, but
# rather as a template for how to use update-alternatives to manage
# displaymanagers and desktop sessions. It is specifically taylored for
# my SuSE Tumbleweed system and probably won't work for your system.
#
# Modify this script with the particulars for your system and save it to
# reconstruct your displaymanager and desktop links and entries.
#
# update-alternatives based configuration script
# for displaymanagers and desktop sessions
# used by wm-dt-ua-config
#---------------------------------------------------------------
# update-alternatives
#
# actions:  --install <link> <name> <path> <priority>
#           --remove <name> <path>
#           --set <name> <path>
#           --list <name>
#           --display <name>
#           --auto <name>
#
#       link     - the generic name for the symlink
#       name     - the name of the alternative
#       path     - the actual file to be linked to
#       priority - integer value, higher value = higher priority
#            used when --auto is set
#            --remove removes the given path from the alternatives for name
#            --set sets the given path as the current choice for name
#            --list lists all choices for name
#            --display shows the current choice and all alternatives for name
#            --auto sets the choice for name to automatic mode
#            selecting the highest priority available alternative
#
#---------------------------------------------------------------
# START SCRIPT
#---------------------------------------------------------------
# 01 - REMOVE DISPLAYMANAGER
# Source is update-alternatives

update-alternatives --remove default-displaymanager /usr/lib/X11/displaymanagers/console
update-alternatives --remove default-displaymanager /usr/lib/X11/displaymanagers/sddm
update-alternatives --remove default-displaymanager /usr/lib/X11/displaymanagers/xdm
#---------------------------------------------------------------
# 02 - REMOVE DESKTOPS
# Source is update-alternatives
update-alternatives --remove /usr/share/wayland-sessions/plasmawayland.desktop
update-alternatives --remove /usr/share/xsessions/icewm.desktop
update-alternatives --remove /usr/share/xsessions/plasma6.desktop
#---------------------------------------------------------------
# 03 - PREPARE DISPLAYMANAGERS FOR INSTALLATION
# Source is /usr/lib/X11/displaymanagers
# Output -s dms.lst
#---------------------------------------------------------------
# 04 - INSTALL DISPLAYMANAGERS
# Source is dms.lst
# --install <link> <name> <path> <priority>
update-alternatives --install /usr/lib/X11/displaymanagers/default-displaymanager default-displaymanager /usr/lib/X11/displaymanagers/console 10
update-alternatives --install /usr/lib/X11/displaymanagers/default-displaymanager default-displaymanager /usr/lib/X11/displaymanagers/xdm 20
update-alternatives --install /usr/lib/X11/displaymanagers/default-displaymanager default-displaymanager /usr/lib/X11/displaymanagers/sddm 40
#---------------------------------------------------------------
# 05 - PREPARE WAYLAND DESKTOPS FOR INSTALLATION
# Source is /usr/share/wayland-sessions
# Output is wdt.lst
#---------------------------------------------------------------
# 06 - INSTALL WAYLAND DESKTOPS
# Source is wdt.lst
update-alternatives --install /usr/share/wayland-sessions/default-desktop default-waylandsession.desktop /usr/share/wayland-sessions/plasmawayland.desktop 40
#---------------------------------------------------------------
# 07 - PREPARE X DESKTOPS FOR INSTALLATION
# Source is /usr/share/xsessions
# Output -s xdt.lst
#---------------------------------------------------------------
# 08 - INSTALL X DESKTOPS
Source is xdt.lst
update-alternatives --install /usr/share/xsessions/default-desktop default-xsession-desktop /usr/share/xsessions/plasma6.desktop 40
update-alternatives --install /usr/share/xsessions/default-desktop default-xsession-desktop /usr/share/xsessions/icewm.desktop 20
#---------------------------------------------------------------
