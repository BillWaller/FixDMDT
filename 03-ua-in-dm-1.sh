#!/bin/bash
# 03-ua-in-dm-1.sh
#
#
echo "# 03 - PREPARE DISPLAYMANAGERS FOR INSTALLATION
# Source is /usr/lib/X11/displaymanagers
# Output -s dms.lst" >>run.sh
DISPLAYMANAGERS=/usr/lib/X11/displaymanagers
find "$DISPLAYMANAGERS" -type f -print | sed 's/$/ 0/' >dms.out 2>/dev/null
rc=$?
if [ "$rc" != "0" ]; then
    echo find returned error $rc
    exit 1
fi
if [ -s dms.out ]; then
    cat dms.inst dms.out >dms.lst
else
    echo no displaymanagers found in "$DISPLAYMANAGERS"
    exit 1
fi

vi dms.lst
echo "#---------------------------------------------------------------" >>run.sh
