#!/bin/bash
# 08-ua-in-xdt-2.sh
# install X desktops into update-alternatives
#
echo "# 08 - INSTALL X DESKTOPS
# Source is xdt.lst" >>run.sh
IFS="
"
ua() {
    echo update-alternatives "$@"
}

ua-in-dt() {
    ua --install \
        /usr/share/xsessions/default-desktop \
        default-xsession-desktop "$1" "$2"
}

grep -v "^\s*#" xdt.lst | while read -r dt; do
    if [ -f "$(echo "$dt" | cut -d' ' -f1)" ]; then
        ua-in-dt "$dt"
    fi
done >>run.sh
echo "#---------------------------------------------------------------" >>run.sh
