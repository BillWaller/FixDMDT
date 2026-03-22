#!/bin/bash
# ua-in-dm-2.sh
# install displaymanagers into update-alternatives
#
IFS="
"
echo "# 04 - INSTALL DISPLAYMANAGERS
# Source is dms.lst" >>run.sh
ua() {
    echo update-alternatives "$@"
}

ua-in-dm() {
    ua --install \
        /usr/lib/X11/displaymanagers/default-displaymanager \
        default-displaymanager "$1" "$2"
}

grep -v "^\s*#" dms.lst | while read -r dm; do
    if [ -f "$(echo "$dm" | cut -d' ' -f1)" ]; then
        ua-in-dm "$dm"
    fi
done >>run.sh
echo "#---------------------------------------------------------------" >>run.sh
