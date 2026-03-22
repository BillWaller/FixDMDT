#!/bin/bash
# 05-ua-in-wdt-1.sh
# WAYLAND DESKTOP
#

echo "# 05 - PREPARE WAYLAND DESKTOPS FOR INSTALLATION
# Source is /usr/share/wayland-sessions
# Output is wdt.lst" >>run.sh
WAYLAND_DESKTOPS=/usr/share/wayland-sessions
find "$WAYLAND_DESKTOPS" -type f -print | sed 's/$/ 0/' >wdt.out 2>/dev/null
rc=$?
if [ "$rc" != "0" ]; then
    echo find returned error $rc
    exit 1
fi
if [ ! -s dms.lst ]; then
    echo no displaymanagers found in "$WAYLAND_DESKTOPS"
    exit 1
fi
cat wdt.inst wdt.out >wdt.lst
vi wdt.lst
echo "#---------------------------------------------------------------" >>run.sh
