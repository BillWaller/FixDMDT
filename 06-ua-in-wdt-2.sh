#!/bin/bash
# 07-ua-in-wdt-2.sh
# install wayland desktops into update-alternatives
#
IFS="
"
ua() {
    echo update-alternatives "$@"
}

ua-in-dt() {
    ua --install \
        /usr/share/wayland-sessions/default-desktop \
        default-waylandsession.desktop "$1" "$2"
}
echo "# 06 - INSTALL WAYLAND DESKTOPS
# Source is wdt.lst" >>run.sh
grep -v "^\s*#" wdt.lst | while read -r dt; do
    if [ -f "$(echo "$dt" | cut -d' ' -f1)" ]; then
        ua-in-dt "$dt"
    fi
done >>run.sh
echo "#---------------------------------------------------------------" >>run.sh
