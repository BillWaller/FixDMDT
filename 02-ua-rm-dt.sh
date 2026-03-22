#!/bin/bash
# 02-ua-rm-dt.sh
# remove desktops

# REMOVE TAMPERED WAYLAND DESKTOP
# update-alternatives --remove default-waylandsession.desktop \
#     /usr/share/wayland-sessions/gnome.desktop

ua() {
    update-alternatives "$@"
}

ua-get-dt() {
    update-alternatives --display "$1" 2>/dev/null |
        grep "^[/]" 2>/dev/null |
        sed 's/\s.*//g' 2>/dev/null
}

ua-rm-dt() {
    for dt in $(ua-get-dt "$1"); do
        echo "update-alternatives --remove $dt"
    done
}

echo "# 02 - REMOVE DESKTOPS
# Source is update-alternatives" >>run.sh

for ddt in $(update-alternatives --get-selections | grep "default-.*desktop"); do
    ua-rm-dt "$ddt"
done >>run.sh
echo "#---------------------------------------------------------------" >>run.sh
